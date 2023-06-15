package controller;

import dto.Pageable;
import model.Hotel;
import model.ServiceModel;
import model.Transport;
import service.HotelService;
import service.ServiceSV;
import service.TransportService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ServiceServlet", value = "/service_manager")
public class ServiceServlet extends HttpServlet {
    private ServiceSV serviceSV = new ServiceSV();
    private HotelService hotelService = new HotelService();
    private TransportService transportService = new TransportService();
    private int TOTAL_ITEMS = 5;
    private String message;
    private String err;
    private double totalPrice;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":

                break;
            case "create":
                showCreatServicePage(req, resp);
                break;
            case "edit":
                showEditPage(req, resp);
                break;
            case "delete":
                deleteService(req, resp);
                break;
            default:
                diplayService(req, resp);
        }
    }

    private void deleteService(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        serviceSV.deleteService(id);

        diplayService(req, resp);
    }

    private void showEditPage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        ServiceModel serviceModel = serviceSV.findById(id);

        req.setAttribute("service", serviceModel);
        req.setAttribute("hotels", hotelService.findAll());
        req.setAttribute("transports", transportService.findAll());
        req.getRequestDispatcher("editService.jsp").forward(req, resp);

    }

    private void showCreatServicePage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("hotels", hotelService.findAll());
        req.setAttribute("transports", transportService.findAll());
        req.getRequestDispatcher("createService.jsp").forward(req, resp);
    }

    private void diplayService(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String search = req.getParameter("search");

        int page = 1;
        if (req.getParameter("page") != null) {
            page = Integer.parseInt(req.getParameter("page"));
        }
        String sortBy = req.getParameter("sortBy");
        if (sortBy == null) {
            sortBy = "asc";
        }
        String nameField = req.getParameter("nameField");
        if (nameField == null) {
            nameField = "service.service_id";
        }

        Pageable pageable = new Pageable(search, page, TOTAL_ITEMS, nameField, sortBy);

        req.setAttribute("pageable", pageable);
        req.setAttribute("services", serviceSV.findAll(pageable));
        req.getRequestDispatcher("displayService.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":
                createService(req, resp);
                break;
            case "edit":
                editService(req, resp);
                break;
        }

    }

    private void editService(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int idService = Integer.parseInt(req.getParameter("id"));

        int idHotel = Integer.parseInt(req.getParameter("hotel"));
        Hotel hotel = hotelService.findById(idHotel);

        int idTransport = Integer.parseInt(req.getParameter("transport"));
        Transport transport = transportService.findById(idTransport);

        for (ServiceModel serviceModel : serviceSV.findAll()) {
            if (serviceModel.getHotelName().getId() == idHotel && serviceModel.getTransportName().getId() == idTransport) {
                err= "This service already exists ";
                req.setAttribute("err",err);
                req.setAttribute("transports", transportService.findAll());
                req.setAttribute("hotels", hotelService.findAll());
                req.getRequestDispatcher("editService.jsp").forward(req, resp);
                return;
            }
        }

        ServiceModel serviceModel = new ServiceModel(idService, hotel, transport);
        serviceSV.editService(serviceModel);

        message = "Successfully";
        totalPrice = hotel.getPrice() + transport.getPrice();
        req.setAttribute("message", message);
        req.setAttribute("totalPrice", totalPrice);
        req.setAttribute("service", serviceModel);
        req.setAttribute("transports", transportService.findAll());
        req.setAttribute("hotels", hotelService.findAll());
        req.getRequestDispatcher("editService.jsp").forward(req, resp);
    }

    private void createService(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int idHotel = Integer.parseInt(req.getParameter("hotel"));
        Hotel hotel = hotelService.findById(idHotel);

        int idTransport = Integer.parseInt(req.getParameter("transport"));
        Transport transport = transportService.findById(idTransport);

        ServiceModel serviceModel = new ServiceModel(hotel, transport);
        serviceSV.createService(serviceModel);

        message = "Succesfully";
        totalPrice = hotel.getPrice() + transport.getPrice();
        req.setAttribute("message", message);
        req.setAttribute("totalPrice", totalPrice);
        req.setAttribute("hotels", hotelService.findAll());
        req.setAttribute("transports", transportService.findAll());
        req.setAttribute("service", serviceModel);
        req.getRequestDispatcher("createService.jsp").forward(req, resp);
    }
}
