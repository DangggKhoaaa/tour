package model;

import java.time.LocalDate;

public class TourTicket {
    private int tourTicketId;
    private User user;
    private Tour tour;
    private ServiceModel serviceModel;
    private int quantity;
    private double totalPrice;
    private String status;
    private String description;
    private LocalDate buyDay;

    public String getStatus() {
        return status;
    }

    public LocalDate getBuyDay() {
        return buyDay;
    }

    public void setBuyDay(LocalDate buyDay) {
        this.buyDay = buyDay;
    }

    public TourTicket(int tourTicketId, User user, Tour tour, ServiceModel serviceModel, int quantity, double totalPrice, String status, String description,LocalDate buyDay) {
        this.tourTicketId = tourTicketId;
        this.user = user;
        this.tour = tour;
        this.serviceModel = serviceModel;
        this.quantity = quantity;
        this.totalPrice = totalPrice;
        this.status = status;
        this.description = description;
        this.buyDay=buyDay;
    }

    public TourTicket(User user, Tour tour, ServiceModel serviceModel, int quantity, double totalPrice, String status, String description,LocalDate buyDay) {
        this.user = user;
        this.tour = tour;
        this.serviceModel = serviceModel;
        this.quantity = quantity;
        this.totalPrice = totalPrice;
        this.status = status;
        this.description = description;
        this.buyDay=buyDay;
    }

    public int getTourTicketId() {
        return tourTicketId;
    }

    public void setTourTicketId(int tourTicketId) {
        this.tourTicketId = tourTicketId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Tour getTour() {
        return tour;
    }

    public void setTour(Tour tour) {
        this.tour = tour;
    }

    public ServiceModel getServiceModel() {
        return serviceModel;
    }

    public void setServiceModel(ServiceModel serviceModel) {
        this.serviceModel = serviceModel;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String isStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
