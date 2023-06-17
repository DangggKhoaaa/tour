package controller;

import dao.HotelDAO;
import dto.Pageable;
import model.*;
import service.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "TourTicketServlet", value = "/tour_ticket")
public class TourTicketServlet extends HttpServlet {
    int totalItem =5;
    TourTicketService tourTicketService=new TourTicketService();
    UserService userService=new UserService();
    TourService tourService =new TourService();
    private ServiceSV serviceSV = new ServiceSV();
    private HotelService hotelService = new HotelService();
    private TransportService transportService = new TransportService();
    private int TOTAL_ITEMS = 5;
    private String message;
    private String err;
    private double totalPrice;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");

        if (action == null){
            action = "";
        }

        switch (action){
            case "add":
                addService(req,resp);
                break;
            case "displayFalse":
                showTicketFalse(req,resp);
                break;

            default:
                showBookingPage(req,resp);
        }
    }



    private void showTicketFalse(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String search =req.getParameter("search");
        int page = 1;
        if(req.getParameter("page") != null){
            page = Integer.parseInt(req.getParameter("page"));
        }
        String fieldName="tour_ticket_id";
        if(req.getParameter("fieldName") != null){
            fieldName = req.getParameter("fieldName");
        }
        String sortby ="desc";
        if(req.getParameter("sortby") != null){
            sortby = req.getParameter("sortby");
        }

        Pageable pageAble =new Pageable(search,page,totalItem,fieldName,sortby);
        List<TourTicket> tourTicketList =tourTicketService.findAllFalse(pageAble);
        req.setAttribute("pageable",pageAble);
        req.setAttribute("ticketFalse",tourTicketService.findAllFalse(pageAble));
        req.getRequestDispatcher("index.jsp").forward(req,resp);
    }

    private void addService(HttpServletRequest req, HttpServletResponse resp) {

    }

    private void showBookingPage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int idTour = Integer.parseInt(req.getParameter("tour_id"));
        Tour tour = tourService.findById(idTour);
       int id = Integer.parseInt(req.getParameter("user_id"));
        User user =userService.findById(id);
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
        req.setAttribute("tour",tour);
        req.setAttribute("user",user);
        req.setAttribute("pageable", pageable);
        req.setAttribute("services", serviceSV.findAll(pageable));

        req.getRequestDispatcher("booking.jsp").forward(req,resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");

        if (action == null){
            action = "";
        }
        switch (action){
            case "create":
                createTicket(req,resp);
                break;
            case "booked":
                booked(req,resp);
                break;
            default:
                showBookingPage(req,resp);

        }
    }

    private void booked(HttpServletRequest req, HttpServletResponse resp) {

    }

    private void createTicket(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int tour_id = Integer.parseInt(req.getParameter("tour_id"));
        Tour tour=tourService.findById(tour_id);
        int user_id = Integer.parseInt(req.getParameter("user_id"));
        User user =userService.findById(user_id);
        int hotel_id = Integer.parseInt(req.getParameter("hotel"));
        Hotel hotel=hotelService.findById(hotel_id);
        int transport_id = Integer.parseInt(req.getParameter("transport"));
        Transport transport=transportService.findById(transport_id);
        ServiceModel serviceModel=new ServiceModel(hotel,transport);
        serviceSV.createService(serviceModel);

        int idsv=serviceSV.find_id();
        ServiceModel serviceModel1 = serviceSV.findById(idsv);
        int quantity = Integer.parseInt(req.getParameter("quantity"));
        String  description = req.getParameter("description");
        double total_price= (tour.getPrice()+hotel.getPrice()+transport.getPrice())*quantity;
        TourTicket tourTicket=new TourTicket(user,tour,serviceModel1,quantity,total_price,false,description);


        tourTicketService.createTOurTicket(tourTicket);

        req.setAttribute("message","Đặt thành công");
        req.setAttribute("tourTicket",tourTicket);
        req.getRequestDispatcher("booking.jsp").forward(req,resp);
    }
}
