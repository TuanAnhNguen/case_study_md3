package controller;

import dto.CustomerDto;
import model.Customer;
import model.CustomerType;
import service.CustomerService;
import service.CustomerTypeService;
import service.ICustomerTypeService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

@WebServlet(name = "CustomerController", value = "/customers")
public class CustomerController extends HttpServlet {
    private static CustomerService customerService = new CustomerService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showFormCreate(req, resp);
                break;
            case "delete":
                deleteById(req, resp);
                break;
            case "update":
                showFormUpdate(req, resp);
                break;
            case "search":
                searchByName(req, resp);
                break;
            default:
                showListCustomer(req, resp);
        }
    }

    private void showFormUpdate(HttpServletRequest req, HttpServletResponse resp) {

    }

    private void searchByName(HttpServletRequest req, HttpServletResponse resp) {
        String searchName = req.getParameter("searchName");
        List<CustomerDto> searchList = customerService.search(searchName);
        req.setAttribute("searchList", searchList);
        try {
            req.getRequestDispatcher("/customer/list.jsp").forward(req, resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void deleteById(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int deleteId = Integer.parseInt(req.getParameter("deleteId"));
        boolean isDeleteSuccess = customerService.deleteById(deleteId);
        String message = "Xoa khong thanh cong";
        if (isDeleteSuccess) {
            message = "Xoa thanh cong";
        }
        resp.sendRedirect("/customers?message" + message);
    }

    private void showFormCreate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<CustomerDto> customerList = customerService.findAll();
        req.setAttribute("customerList", customerList);
        req.getRequestDispatcher("/customer/create.jsp").forward(req, resp);
    }

    private void showListCustomer(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<CustomerDto> customers = customerService.findAll();
//        List<CustomerType> customerTypes = customerService.findAll();
        req.setAttribute("customerList", customers);
        req.getRequestDispatcher("/customer/list.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                save(req, resp);
                break;
            case "delete":
                break;
            case "update":
                break;
            case "search":
                break;
            default:
        }
    }

    private void save(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        Date birthday = Date.valueOf(req.getParameter("birthday"));
        boolean gender = Boolean.parseBoolean(req.getParameter("gender"));
        String idCard = req.getParameter("idCard");
        String phone = req.getParameter("phone");
        String email = req.getParameter("email");
        String address = req.getParameter("address");
        int customerTypeId = Integer.parseInt(req.getParameter("customerTypeId"));
        Customer customer = new Customer(id, name, birthday, gender, idCard, phone, email, address, customerTypeId);
        boolean flag = customerService.add(customer);
        if (flag) {
            resp.sendRedirect("/customers?message=Them moi thanh cong");
        } else {
            req.setAttribute("message", "Them moi khong thanh cong");
            showFormCreate(req, resp);
        }
    }
}
