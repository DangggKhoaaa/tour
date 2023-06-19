package dao;


import dto.Pageable;
import model.*;
import service.ServiceSV;
import service.TourService;
import service.UserService;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class TourTicketDAO extends ConectionDatabase {
    TourService tourService = new TourService();
    UserService userService = new UserService();
    ServiceSV serviceSV = new ServiceSV();
    private final String SELECT_TOUR_TICKET_FALSE = "select * from tour_ticket left  join `user` on `user`.user_id =tour_ticket.user_id\n" +
            "\t\t\t\t\t\t\tleft join tours on tours.tour_id =tour_ticket.tour_id\n" +
            "                            left join service on service.service_id =tour_ticket.service_id\n" +
            "                            left join transport on service.transport_id =transport.transport_id\n" +
            "                            left join hotel on service.hotel_id =hotel.hotel_id\n" +
            "                            where tour_ticket.`status`<> 'true' and (`user`.user_name like '%s' or `user`.full_name like '%s' or tours.`name` like '%s' or transport.`name` like '%s' or hotel.`name` like '%s')\n" +
            "                             order by %s %s \n" +
            "                             limit %d offset %d";
    private final String SELECT_TOUR_TICKET_BY_USER_ID = "select * from tour_ticket left  join `user` on `user`.user_id =tour_ticket.user_id\n" +
            "\t\t\t\t\t\t\tleft join tours on tours.tour_id =tour_ticket.tour_id\n" +
            "                            left join service on service.service_id =tour_ticket.service_id\n" +
            "                            left join transport on service.transport_id =transport.transport_id\n" +
            "                            left join hotel on service.hotel_id =hotel.hotel_id\n" +
            "                            where tour_ticket.user_id = %d and (`user`.user_name like '%s' or `user`.full_name like '%s' or tours.`name` like '%s' or transport.`name` like '%s' or hotel.`name` like '%s')\n" +
            "                             order by %s %s \n" +
            "                             limit %d offset %d";
    private final String DELETE_TOUR_TICKET_BY_ID = "DELETE FROM `tour_ticket` WHERE (`tour_ticket_id` = ? );";

    private final String INSERT_TOUR_TICKET = "INSERT INTO `tour_ticket` (`user_id`, `tour_id`, `service_id`, `quantity`, `total_price`, `status`, `decription`,`buyDate`) VALUES (?, ?, ?, ?, ?, ?, ?,?);";
    private final String UPDATE_TOUR_TICKET = "UPDATE `tour_ticket` SET `user_id` = ?, `tour_id` = ?, `service_id` = ?, `quantity` = ? , `total_price` = ? , `status` = ? , `decription` = ? WHERE (`tour_ticket_id` = ?);";
    private final String TOTAL_TOUR_TICKET = "select count(1) as total_tour_ticket from tour_ticket left  join `user` on `user`.user_id =tour_ticket.user_id\n" +
            "\t\t\t\t\t\t\tleft join tours on tours.tour_id =tour_ticket.tour_id\n" +
            "                            left join service on service.service_id =tour_ticket.service_id\n" +
            "                            left join transport on service.transport_id =transport.transport_id\n" +
            "                            left join hotel on service.hotel_id =hotel.hotel_id\n" +
            "                            where tour_ticket.`status` = false and `user`.user_name like ? or `user`.full_name like ? or tours.`name` like ? or transport.`name` like ? or hotel.`name` like ?";

    private final String ACCEPT ="UPDATE `tour_ticket` SET `status` = 'true' WHERE (`tour_ticket_id` = ?);";
    private final String PAY="UPDATE `tour_ticket` SET `status` = 'pay',payDate = curdate()  WHERE (`tour_ticket_id` = ?);";
    private final String DELETE_TOURTICKET_FALSE_2DAY="DELETE FROM `tour`.`tour_ticket` WHERE  datediff(CURDATE()-2,tour_ticket.buyDate)>0 and `tour_ticket`.`status`='false';";
    private final String FIND_TOUR_TICKET_BY_MONTH="select tour_ticket.*  from tour_ticket\n" +
            " where `status` = 'true' and month(payDate) like '%s' and year(payDate) like '%s' \n" +
            " order by %s %s\n" +
            " limit %d offset %d";
    private final String TOTAL_FINDTOUR_TICKET_BY_MONTH="select count(1) as total_tour_ticket from tour_ticket\n" +
            "             where `status` = 'true' and month(payDate)= '%s' and year(payDate)='%s' ";
    private final String DOANH_THU="select sum(total_price) as total from tour_ticket\n" +
            "             where `status` = 'true' and month(payDate) like '%s' and year(payDate) like '%s'";
    public List<TourTicket> findAllFalse(Pageable pageAble) {
        List<TourTicket> tourTickets = new ArrayList<>();
        String search = pageAble.getSearch();
        if (search == null) {
            search = "";
        }
        search = "%" + search + "%";
        String sortby = pageAble.getSortBy();
        String fieldName = pageAble.getNameField();

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection
                     .prepareStatement(String.format(SELECT_TOUR_TICKET_FALSE, search, search, search, search, search, fieldName, sortby, pageAble.getTotalItems(), (pageAble.getPage() - 1) * pageAble.getTotalItems()))) {

            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("tour_ticket_id");
                int tour_id = rs.getInt("tour_id");
                Tour tour = tourService.findById(tour_id);
                int user_id = rs.getInt("user_id");
                User user = userService.findById(user_id);
                int service = rs.getInt("service_id");
                ServiceModel serviceModel = serviceSV.findById(service);
                int quantity = rs.getInt("quantity");
<<<<<<< Updated upstream
                double total_price = (tour.getPrice() + serviceModel.getHotelName().getPrice() + serviceModel.getTransportName().getPrice())*quantity;

=======
                double total_price = (tour.getPrice() + serviceModel.getHotelName().getPrice() + serviceModel.getTransportName().getPrice()) * quantity;
>>>>>>> Stashed changes
                String status = rs.getString("status");
                String description = rs.getString("description");
                LocalDate buyDate= rs.getDate("buyDate").toLocalDate();
                LocalDate payDate;
                try{
                     payDate = rs.getDate("payDate").toLocalDate();
                }catch (Exception e){
                    payDate=null;
                }

                tourTickets.add(new TourTicket(id, user, tour, serviceModel, quantity, total_price, status, description,buyDate,payDate));
            }
            PreparedStatement statementTotalUsers = connection.prepareStatement(TOTAL_TOUR_TICKET);
            statementTotalUsers.setString(1, search);
            statementTotalUsers.setString(2, search);
            statementTotalUsers.setString(3, search);
            statementTotalUsers.setString(4, search);
            statementTotalUsers.setString(5, search);
            ResultSet rsTotalUser = statementTotalUsers.executeQuery();
            while (rsTotalUser.next()) {
                double total_tour = rsTotalUser.getDouble("total_tour_ticket");
                double totalItems = Double.parseDouble(pageAble.getTotalItems() + "");
                int totalPages = (int)
                        Math.ceil(total_tour / totalItems);
                pageAble.setTotalPage(totalPages);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return tourTickets;
    }

    public List<TourTicket> findAllByUserId(Pageable pageAble, User use) {

        List<TourTicket> tourTickets = new ArrayList<>();
        String search = pageAble.getSearch();
        if (search == null) {
            search = "";
        }
        search = "%" + search + "%";
        String sortby = pageAble.getSortBy();
        String fieldName = pageAble.getNameField();

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection
                     .prepareStatement(String.format(SELECT_TOUR_TICKET_BY_USER_ID, use.getId(), search, search, search, search, search, fieldName, sortby, pageAble.getTotalItems(), (pageAble.getPage() - 1) * pageAble.getTotalItems()))) {

            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("tour_ticket_id");
                int tour_id = rs.getInt("tour_id");
                Tour tour = tourService.findById(tour_id);
                int userId = rs.getInt("user_id");
                User user = userService.findById(userId);
                int service = rs.getInt("service_id");
                ServiceModel serviceModel = serviceSV.findById(service);
                int quantity = rs.getInt("quantity");
<<<<<<< Updated upstream

                double total_price = (tour.getPrice() + serviceModel.getHotelName().getPrice() + serviceModel.getTransportName().getPrice())*quantity;
=======
                double total_price = (tour.getPrice() + serviceModel.getHotelName().getPrice() + serviceModel.getTransportName().getPrice()) * quantity;
>>>>>>> Stashed changes
                String status = rs.getString("status");
                String description = rs.getString("description");
                LocalDate buyDate= rs.getDate("buyDate").toLocalDate();

                tourTickets.add(new TourTicket(id, user, tour, serviceModel, quantity, total_price, status, description,buyDate));
            }
            PreparedStatement statementTotalUsers = connection.prepareStatement(TOTAL_TOUR_TICKET);
            statementTotalUsers.setString(1, search);
            statementTotalUsers.setString(2, search);
            statementTotalUsers.setString(3, search);
            statementTotalUsers.setString(4, search);
            statementTotalUsers.setString(5, search);
            ResultSet rsTotalUser = statementTotalUsers.executeQuery();
            while (rsTotalUser.next()) {
                double total_tour = rsTotalUser.getDouble("total_tour_ticket");
                double totalItems = Double.parseDouble(pageAble.getTotalItems() + "");
                int totalPages = (int)
                        Math.ceil(total_tour / totalItems);
                pageAble.setTotalPage(totalPages);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        List<TourTicket> tourTickets1=tourTickets;
        return tourTickets;
    }

    public void createTourTicket(TourTicket tourTicket) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection
                     .prepareStatement(INSERT_TOUR_TICKET);) {
            System.out.println(preparedStatement);
            int us = tourTicket.getUser().getId();
            preparedStatement.setInt(1, tourTicket.getUser().getId());
            int tou = tourTicket.getTour().getTour_id();
            preparedStatement.setInt(2, tourTicket.getTour().getTour_id());
            int sêr = tourTicket.getServiceModel().getId();
            preparedStatement.setInt(3, tourTicket.getServiceModel().getId());
            int qua = tourTicket.getQuantity();
            preparedStatement.setInt(4, tourTicket.getQuantity());
            double pri = tourTicket.getTotalPrice();
            preparedStatement.setDouble(5, tourTicket.getTotalPrice());
            String ds = String.valueOf(tourTicket.isStatus());
            preparedStatement.setString(6, String.valueOf(tourTicket.isStatus()));
            preparedStatement.setString(7, tourTicket.getDescription());
            preparedStatement.setDate(8, Date.valueOf(tourTicket.getBuyDay()));
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public void editTourTicket(TourTicket tourTicket) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection
                     .prepareStatement(UPDATE_TOUR_TICKET);) {
            System.out.println(preparedStatement);
            preparedStatement.setInt(1, tourTicket.getUser().getId());
            preparedStatement.setInt(2, tourTicket.getTour().getTour_id());
            preparedStatement.setInt(3, tourTicket.getServiceModel().getId());
            preparedStatement.setInt(4, tourTicket.getQuantity());
            preparedStatement.setDouble(5, tourTicket.getTotalPrice());
            preparedStatement.setString(6, String.valueOf(tourTicket.isStatus()));
            preparedStatement.setString(7, tourTicket.getDescription());
            preparedStatement.setInt(8, tourTicket.getTourTicketId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public void deleteTourTicket(int id) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection
                     .prepareStatement(DELETE_TOUR_TICKET_BY_ID);) {
            System.out.println(preparedStatement);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
    public void accept (int id ){
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection
                     .prepareStatement(ACCEPT);) {
            System.out.println(preparedStatement);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
    public void pay (int id ){
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection
                     .prepareStatement(PAY);) {
            System.out.println(preparedStatement);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

    }
    public void deleteOutOfDate(){
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection
                     .prepareStatement(DELETE_TOURTICKET_FALSE_2DAY);) {
            System.out.println(preparedStatement);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
    public List<TourTicket> findTicketByMonth( Integer month , Integer year,Pageable pageAble){
        List<TourTicket> tourTickets = new ArrayList<>();
        String search = pageAble.getSearch();
        if (search == null) {
            search = "";
        }
        Integer mont=month;
        Integer yer=year;
        String months=null;
        if(month!=null){
          months= String.valueOf(month);
        }else {
            months="%%";
        }
        String years=null;
        if(year!=null){
            years= String.valueOf(year);
        }else {
            years="%"+2023+"%";
        }
        search = "%" + search + "%";
        String sortby = pageAble.getSortBy();
        String fieldName = pageAble.getNameField();

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection
                     .prepareStatement(String.format(FIND_TOUR_TICKET_BY_MONTH, months, years,   fieldName, sortby, pageAble.getTotalItems(), (pageAble.getPage() - 1) * pageAble.getTotalItems()))) {

            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("tour_ticket_id");
                int tour_id = rs.getInt("tour_id");
                Tour tour = tourService.findById(tour_id);
                int user_id = rs.getInt("user_id");
                User user = userService.findById(user_id);
                int service = rs.getInt("service_id");
                ServiceModel serviceModel = serviceSV.findById(service);
                int quantity = rs.getInt("quantity");
                double total_price = (tour.getPrice() + serviceModel.getHotelName().getPrice() + serviceModel.getTransportName().getPrice())*quantity;

                String status = rs.getString("status");
                String description = rs.getString("decription");
                LocalDate buyDate= rs.getDate("buyDate").toLocalDate();
                LocalDate payDate;
                try{
                    payDate = rs.getDate("payDate").toLocalDate();
                }catch (Exception e){
                    payDate=null;
                }
                    TourTicket tourTicket=new TourTicket(id, user, tour, serviceModel, quantity, total_price, status, description,buyDate,payDate);
                tourTickets.add(tourTicket);
            }
            PreparedStatement statementTotalUsers = connection.prepareStatement(String.format(TOTAL_FINDTOUR_TICKET_BY_MONTH,months,years));




            ResultSet rsTotalUser = statementTotalUsers.executeQuery();
            while (rsTotalUser.next()) {
                double total_tour = rsTotalUser.getDouble("total_tour_ticket");
                double totalItems = Double.parseDouble(pageAble.getTotalItems() + "");
                int totalPages = (int)
                        Math.ceil(total_tour / totalItems);
                pageAble.setTotalPage(totalPages);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        List<TourTicket> tourTickets1 =tourTickets;
        return tourTickets;
    }
public double doanhThu(Integer month ,Integer year){
        double total_tour = 0;
    Integer mont=month;
    Integer yer=year;
    String months=null;
    if(month!=null){
        months= String.valueOf(month);
    }else {
        months="%%";
    }
    String years=null;
    if(year!=null){
        years= String.valueOf(year);
    }else {
        years="%"+2023+"%";
    }
    try (Connection connection = getConnection();
         PreparedStatement preparedStatement = connection
                 .prepareStatement(String.format(DOANH_THU,months,years))) {

        System.out.println(preparedStatement);
        ResultSet rs = preparedStatement.executeQuery();
        while (rs.next()) {
             total_tour = rs.getDouble("total");

            return total_tour;
        }
    } catch (SQLException e) {
        System.out.println(e.getMessage());
    }
    return total_tour;
}
}




