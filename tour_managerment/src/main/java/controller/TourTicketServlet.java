package controller;

import dto.Pageable;
import service.HotelService;
import service.ServiceSV;
import service.TransportService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "TourTicketServlet", value = "/tour_ticket")
public class TourTicketServlet extends HttpServlet {
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

        if (action == null){
            action = "";
        }

        switch (action){
            case "add":
                addService(req,resp);
                break;
            default:
                showBookingPage(req,resp);
        }
    }

    private void addService(HttpServletRequest req, HttpServletResponse resp) {

    }

    private void showBookingPage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
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
        req.getRequestDispatcher("booking.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
