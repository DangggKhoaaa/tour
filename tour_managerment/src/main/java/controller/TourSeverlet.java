package controller;

import model.*;
import dto.Pageable;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;
import service.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;
<<<<<<< Updated upstream
import static ultils.FormatForm.checkPrice;
import static ultils.FormatForm.checkString;
=======
import java.util.Objects;

>>>>>>> Stashed changes

@WebServlet(name = "tourSeverlet", value = "/tours")
public class TourSeverlet extends HttpServlet {
    UserService userService = new UserService();
    ServiceSV serviceSV = new ServiceSV();
    private String message;
    TransportService transportService = new TransportService();
    HotelService hotelService = new HotelService();
    int totalItem = 5;
    private final String link = "C:\\Users\\Admin\\Desktop\\study\\Module3\\backup\\src\\main\\webapp\\assets\\image\\";

    TourService tourService = new TourService();
    TagService tagService = new TagService();
    Tour_tagService tour_tagService = new Tour_tagService();

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreate(req, resp);
                break;
            case "edit":
                showEdit(req, resp);
                break;
            case "delete":
                deleteTour(req, resp);
            case "oder":
                showOder(req, resp);
                break;
            case "booking":
                bookingTour(req, resp);
                break;
            case "searchTour":
                userSearchTour(req, resp);
                break;
            case "bookingHaveNoUser":
                bookingHaveNoUser(req, resp);
                break;

            default:
                showTour(req, resp);
        }
    }

    private void bookingHaveNoUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int tour_id = Integer.parseInt(req.getParameter("tour_id"));
        Tour tour = tourService.findById(tour_id);

        req.setAttribute("hotels", hotelService.findAll());
        req.setAttribute("transports", transportService.findAll());
        req.setAttribute("tour", tour);
        req.getRequestDispatcher("booking.jsp").forward(req, resp);
    }

    private void userSearchTour(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String search = req.getParameter("search");
        int page = 1;
        if (req.getParameter("page") != null) {
            page = Integer.parseInt(req.getParameter("page"));
        }
        String fieldName = "t1.tour_id";
        if (req.getParameter("fieldName") != null) {
            fieldName = req.getParameter("fieldName");
        }
        String sortby = "desc";
        if (req.getParameter("sortby") != null) {
            sortby = req.getParameter("sortby");
        }
        Pageable pageAble = new Pageable(search, page, totalItem, fieldName, sortby);
        req.setAttribute("pageable", pageAble);
        List<Tour> tours = tourService.findAll(pageAble);
        req.setAttribute("tours", tourService.findAll(pageAble));
        req.getRequestDispatcher("user.jsp").forward(req, resp);
    }

    private void bookingTour(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int tour_id = Integer.parseInt(req.getParameter("tour_id"));
        Tour tour = tourService.findById(tour_id);
        String ten = tour.getTour_tag();
        int user_id = Integer.parseInt(req.getParameter("user_id"));
        User user = userService.findById(user_id);


        List<Hotel> hotels = hotelService.findAll();
        List<Transport> transports = transportService.findAll();
        req.setAttribute("hotels", hotelService.findAll());
        req.setAttribute("transports", transportService.findAll());
        req.setAttribute("tour", tour);
        req.setAttribute("user", user);
        req.getRequestDispatcher("booking.jsp").forward(req, resp);

    }

    private void showOder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String search = req.getParameter("search");
        int page = 1;
        if (req.getParameter("page") != null) {
            page = Integer.parseInt(req.getParameter("page"));
        }
        String fieldName = "t1.tour_id";
        if (req.getParameter("fieldName") != null) {
            fieldName = req.getParameter("fieldName");
        }
        String sortby = "desc";
        if (req.getParameter("sortby") != null) {
            sortby = req.getParameter("sortby");
        }

        Pageable pageAble = new Pageable(search, page, totalItem, fieldName, sortby);
        req.setAttribute("pageable", pageAble);
        List<Tour> tours = tourService.findAll(pageAble);
        req.setAttribute("tours", tourService.findAll(pageAble));
        req.getRequestDispatcher("oderTour.jsp").forward(req, resp);
    }

    private void deleteTour(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            tour_tagService.deleteByTourId(id);
            tourService.delete(id);

//        String search = req.getParameter("search");
//        int page = 1;
//        if (req.getParameter("page") != null) {
//            page = Integer.parseInt(req.getParameter("page"));
//        }
//        String fieldName = "t1.tour_id";
//        if (req.getParameter("fieldName") != null) {
//            fieldName = req.getParameter("fieldName");
//        }
//        String sortby = "desc";
//        if (req.getParameter("sortby") != null) {
//            sortby = req.getParameter("sortby");
//        }
//        Pageable pageAble = new Pageable(search, page, totalItem, fieldName, sortby);
//        req.setAttribute("pageable", pageAble);
////        List<Tour> tours = tourService.findAll(pageAble);
//        req.setAttribute("tours", tourService.findAll(pageAble));
            showTour(req, resp);
        } catch (Exception exception) {
            message = "Không thể xóa tour đang được sử dụng";
            showTour(req, resp);
        }

    }

    @Override
    public void init() throws ServletException {

    }

    private void showEdit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int tour_id = Integer.parseInt(req.getParameter("id"));
        Tour tour = tourService.findById(tour_id);

//        String img = tour.getImg();
//        String filePart1=null;
//        try{
//            String[] fileParts = img.split("/");
//             filePart1 =fileParts[fileParts.length - 1];
//        }catch (Exception e){
//            filePart1="";
//        }
        String filePart1 = tour.getImg();


        List<Tour_tag> tour_tag = tour_tagService.findTourTagid(tour.getTour_id());
        List<Tag> tagList = tagService.findAll();
        req.setAttribute("filePart1", filePart1);
        req.setAttribute("tour", tour);
        req.setAttribute("tagList", tagList);
        req.setAttribute("tour_tag", tour_tag);
        req.getRequestDispatcher("edit.jsp").forward(req, resp);
    }

    private void showCreate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Tag> tagList = tagService.findAll();

        req.setAttribute("tagList", tagList);
        req.getRequestDispatcher("creat.jsp").forward(req, resp);
    }

    private void showTour(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String search = req.getParameter("search");
        int page = 1;
        if (req.getParameter("page") != null) {
            page = Integer.parseInt(req.getParameter("page"));
        }
        String fieldName = "t1.tour_id";
        if (req.getParameter("fieldName") != null) {
            fieldName = req.getParameter("fieldName");
        }
        String sortby = "desc";
        if (req.getParameter("sortby") != null) {
            sortby = req.getParameter("sortby");
        }
        Pageable pageAble = new Pageable(search, page, totalItem, fieldName, sortby);
        req.setAttribute("pageable", pageAble);
//        List<Tour> tours = tourService.findAll(pageAble);
        req.setAttribute("tours", tourService.findAll(pageAble));
        req.getRequestDispatcher("showTour.jsp").forward(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createTour(req, resp);
                break;
            case "edit":
                editTour(req, resp);
                break;
            case "searchTour":
                userSearchTour(req, resp);
                break;
            default:
                showTour(req, resp);
        }
    }

    private void createTour(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        String name = req.getParameter("name");
//        boolean checkEmptyName = checkString(name);
//        if (!checkEmptyName) {
//            req.setAttribute("messageTourName", "Tên tour không được để trống");
//        }
//        Double price= Double.valueOf(req.getParameter("price"));
//        if (Objects.equals(price.toString(), "")) {
//            req.setAttribute("messagePrice", "Giá tour không được để trống");
//        } else if (price <= 0) {
//            req.setAttribute("messagePrice", "Giá tour phải lớn hơn 0");
//        }
//        LocalDate start_time = LocalDate.parse(req.getParameter("start_time"));
//        LocalDate end_time = LocalDate.parse(req.getParameter("end_time"));
//        String img =req.getParameter("img");
//        String description =req.getParameter("description");
//        if (description == null) {
//            description = "";
//        }
//        Tour tour=new Tour(name,price,start_time,end_time,img,description);
//        tourService.create(tour);
//        int tour_id =tourService.findId();
//        String[] selectedValues = req.getParameterValues("myCheckbox");
//        if(selectedValues!=null){for (String str:selectedValues) {
//            int tag_id= Integer.parseInt(str);
//            Tour_tag tourTag =new Tour_tag(tour_id,tag_id);
//            tour_tagService.create(tourTag);
//        }}
//        req.setAttribute("tour",tour);
//        req.setAttribute("message", "Created");
//        req.setAttribute("tagList", tagService.findAll());
//        req.getRequestDispatcher("creat.jsp").forward(req,resp);
        Tour tour1 = new Tour();
        try {
            ServletFileUpload sf = new ServletFileUpload(new DiskFileItemFactory());
            sf.setHeaderEncoding("UTF-8");
            List<FileItem> multifiles = sf.parseRequest(req);
            String listImage = "";
            for (FileItem item : multifiles) {
                if (item.isFormField()) {
                    // Process regular form field (input type="text|radio|checkbox|etc",
                    // select,etc).
                    String fieldname = item.getFieldName();
                    String fieldvalue = item.getString("UTF-8");
                    switch (fieldname) {
                        case "name":
                            tour1.setName(fieldvalue);
                            break;
                        case "price":
                            tour1.setPrice(Double.parseDouble(fieldvalue));
                            break;
                        case "start_time":
                            tour1.setStart_time(LocalDate.parse(fieldvalue));
                            break;
                        case "end_time":
                            tour1.setEnd_time(LocalDate.parse(fieldvalue));
                            break;
                        case "description":
                            tour1.setDescription(fieldvalue);
                            break;

                    }
                } else {
                    if (!item.getName().isEmpty() && !item.getFieldName().equals("files")) {
                        String filename = FilenameUtils.getName(item.getName());
                        tour1.setImg("/assets/image/" + filename);
                        item.write(new File(link
                                + filename));
                    }
                }
            }
            tourService.create(tour1);
            int tour_id = tourService.findId();
            String[] selectedValues = req.getParameterValues("myCheckbox");
            if (selectedValues != null) {
                for (String str : selectedValues) {
                    int tag_id = Integer.parseInt(str);
                    Tour_tag tourTag = new Tour_tag(tour_id, tag_id);
                    tour_tagService.create(tourTag);
                }
            }
            req.setAttribute("tour", tour1);
            req.setAttribute("message", "Created");
            req.setAttribute("tagList", tagService.findAll());
            req.getRequestDispatcher("creat.jsp").forward(req, resp);
        } catch (FileUploadException e) {
            throw new RuntimeException(e);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
<<<<<<< Updated upstream
        String priceS = req.getParameter("price");
        boolean checkEmptyPrice = checkString(priceS);
        if (!checkEmptyPrice) {
            req.setAttribute("messagePrice", "Giá tour không được để trống");
        } else if (!checkPrice(priceS)) {
            req.setAttribute("messagePrice", "Giá tour phải lớn hơn 0");
        }
        if (checkEmptyName && checkEmptyPrice && checkPrice(priceS)) {
            double price = Double.parseDouble(priceS);
            LocalDate start_time = LocalDate.parse(req.getParameter("start_time"));
            LocalDate end_time = LocalDate.parse(req.getParameter("end_time"));
            String img =req.getParameter("img");
            String description =req.getParameter("description");
            if (description == null) {
                description = "";
            }
            Tour tour=new Tour(name,price,start_time,end_time,img,description);
            tourService.create(tour);
            int tour_id =tourService.findId();
            String[] selectedValues = req.getParameterValues("myCheckbox");
            if(selectedValues!=null){for (String str:selectedValues) {
                int tag_id= Integer.parseInt(str);
                Tour_tag tourTag =new Tour_tag(tour_id,tag_id);
                tour_tagService.create(tourTag);
            }}
            req.setAttribute("tour",tour);
            req.setAttribute("message", "Created");
            req.setAttribute("tagList", tagService.findAll());
            req.getRequestDispatcher("creat.jsp").forward(req,resp);
        } else {
            req.setAttribute("tagList", tagService.findAll());
            req.getRequestDispatcher("creat.jsp").forward(req,resp);
        }


=======
>>>>>>> Stashed changes
    }

    public void editTour(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
<<<<<<< Updated upstream
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        boolean checkEmptyName = checkString(name);
        if (!checkEmptyName) {
            req.setAttribute("messageTourName", "Tên tour không được để trống");
        }
        String priceS = req.getParameter("price");
        boolean checkEmptyPrice = checkString(priceS);
        if (!checkEmptyPrice) {
            req.setAttribute("messagePrice", "Giá tour không được để trống");
        } else if (!checkPrice(priceS)) {
            req.setAttribute("messagePrice", "Giá tour phải lớn hơn 0");
        }
        if (checkEmptyName && checkEmptyPrice && checkPrice(priceS)) {
            double price = Double.parseDouble(priceS);
            LocalDate start_time= LocalDate.parse(req.getParameter("start_time"));
            LocalDate end_time= LocalDate.parse(req.getParameter("end_time"));
            String img =req.getParameter("img");
            String description =req.getParameter("description");

            Tour tour= new Tour(id,name,price,start_time,end_time,img,description);
            tourService.edit(tour);
            tour_tagService.deleteByTourId(id);
            String[] selectedValues = req.getParameterValues("myCheckbox");
            if(selectedValues!=null){for (String str:selectedValues) {
                int tag_id= Integer.parseInt(str);
                tour_tagService.create(new Tour_tag(tour.getTour_id(),tag_id));
            }}

            req.setAttribute("tour",tour);
            req.setAttribute("tagList", tagService.findAll());
            req.setAttribute("message", "edited");
            req.getRequestDispatcher("edit.jsp").forward(req,resp);
        } else {
            Tour tour = tourService.findById(id);
            req.setAttribute("tour",tour);
            req.setAttribute("tagList", tagService.findAll());
            req.getRequestDispatcher("edit.jsp").forward(req,resp);
        }
=======
        Tour tour = new Tour();
        try {
            ServletFileUpload sf = new ServletFileUpload(new DiskFileItemFactory());
            sf.setHeaderEncoding("UTF-8");
            List<FileItem> multifiles = sf.parseRequest(req);
            String listImage = "";
            String value = null;
            for (FileItem item : multifiles) {
                if (item.isFormField()) {

                    String fieldname = item.getFieldName();
                    String fieldvalue = item.getString("UTF-8");
                    switch (fieldname) {
                        case "id":
                            tour.setTour_id(Integer.parseInt(fieldvalue));
                            break;
                        case "name":
                            tour.setName(fieldvalue);
                            break;
                        case "price":
                            tour.setPrice(Double.parseDouble(fieldvalue));
                            break;
                        case "start_time":
                            tour.setStart_time(LocalDate.parse(fieldvalue));
                            break;
                        case "end_time":
                            tour.setEnd_time(LocalDate.parse(fieldvalue));
                            break;
                        case "description":
                            tour.setDescription(fieldvalue);
                            break;
                        case "filePart1":
                            value = fieldvalue;
                            break;
                    }
                } else {
                    if (!item.getName().isEmpty() && !item.getFieldName().equals("files")) {
                        String filename = FilenameUtils.getName(item.getName());
                        tour.setImg("/assets/image/" + filename);
                        item.write(new File(link
                                + filename));
                    } else {
                        tour.setImg(value);
                    }
                }
            }
            tourService.edit(tour);
            tour_tagService.deleteByTourId(tour.getTour_id());
            String[] selectedValues = req.getParameterValues("myCheckbox");
            if (selectedValues != null) {
                for (String str : selectedValues) {
                    int tag_id = Integer.parseInt(str);
                    tour_tagService.create(new Tour_tag(tour.getTour_id(), tag_id));
                }
            }
            req.setAttribute("tour", tour);
            req.setAttribute("tagList", tagService.findAll());
            req.setAttribute("message", "Edited");
            req.getRequestDispatcher("edit.jsp").forward(req, resp);
        } catch (FileUploadException e) {
            throw new RuntimeException(e);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }


//        int id = Integer.parseInt(req.getParameter("id"));
//        String name = req.getParameter("name");
//        double price = Double.parseDouble(req.getParameter("price"));
//        LocalDate start_time = LocalDate.parse(req.getParameter("start_time"));
//        LocalDate end_time = LocalDate.parse(req.getParameter("end_time"));
//        String img = req.getParameter("img");
//        String description = req.getParameter("description");
//
//        Tour tour = new Tour(id, name, price, start_time, end_time, img, description);
//        tourService.edit(tour);
//        tour_tagService.deleteByTourId(id);
//        String[] selectedValues = req.getParameterValues("myCheckbox");
//        if (selectedValues != null) {
//            for (String str : selectedValues) {
//                int tag_id = Integer.parseInt(str);
//                tour_tagService.create(new Tour_tag(tour.getTour_id(), tag_id));
//            }
//
//            req.setAttribute("tour", tour);
//            req.setAttribute("tagList", tagService.findAll());
//            req.setAttribute("message", "edited");
//            req.getRequestDispatcher("edit.jsp").forward(req, resp);
//        }
>>>>>>> Stashed changes

    }
}