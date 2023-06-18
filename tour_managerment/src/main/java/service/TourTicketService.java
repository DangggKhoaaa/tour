package service;

import dao.TourTicketDAO;
import dto.Pageable;
import model.TourTicket;
import model.User;

import java.util.List;

public class TourTicketService {
    TourTicketDAO tourTicketDAO =new TourTicketDAO();
    public List<TourTicket> findAllFalse(Pageable pageable){
        return tourTicketDAO.findAllFalse(pageable);
    }
    public void createTOurTicket (TourTicket tourTicket){
        tourTicketDAO.createTourTicket(tourTicket);
    }
    public void editTourTicket (TourTicket tourTicket){
        tourTicketDAO.editTourTicket(tourTicket);
    }
    public void deleteTourTicket(int id){
        tourTicketDAO.deleteTourTicket(id);
    }
    public List<TourTicket> findAllByUserId(Pageable pageable, User user){
      return   tourTicketDAO.findAllByUserId(pageable,user );
    }
    public void accept(int id ){
        tourTicketDAO.accept(id);
    }
    public void pay (int id ){
        tourTicketDAO.pay(id);
    }
}
