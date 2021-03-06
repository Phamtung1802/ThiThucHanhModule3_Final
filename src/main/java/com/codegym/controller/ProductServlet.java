package com.codegym.controller;

import com.codegym.dao.DAOManger;
import com.codegym.model.Product;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "ProductServlet", urlPatterns = "/products")
public class ProductServlet extends HttpServlet {
    private DAOManger daoManger;

    public void init() {
        daoManger = new DAOManger();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    insertProduct(request, response);
                    break;
                case "edit":
                    updateProduct(request, response);
                    break;
                case "delete":
                    deleteProduct(request, response);
                    break;
                case "search":
                    search(request, response);
                    break;
                default:
                    listProducts(request, response);
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        try {
            switch (action) {
                case "create":
                    showNewForm(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "search":
                    System.out.println("search click button");
                    search(request, response);
                    break;
                default:
                    listProducts(request, response);
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }


    }


    private void search(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String productName = request.getParameter("SearchBox_productName");
        System.out.println("SearchBox_productName = " + productName);

        List<Product> productList = daoManger.productDAO.getProductsBySearch(productName);
        request.setAttribute("productList", productList);
        int results_count = productList.size();
        request.setAttribute("results_count", results_count);

        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        dispatcher.forward(request, response);
    }


    private void listProducts(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {

        List<Product> productList = daoManger.productDAO.selectAllProduct();
        request.setAttribute("productList", productList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        dispatcher.forward(request, response);
    }



    private void insertProduct(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {

        String name= request.getParameter("name");
        double price= Double.parseDouble(request.getParameter("price"));
        int quantity= Integer.parseInt(request.getParameter("quantity"));
        String color= request.getParameter("color");
        String description= request.getParameter("desc");
        int categoryID= Integer.parseInt(request.getParameter("category"));
        daoManger.productDAO.insertProduct(new Product(name, price, quantity, color, description,categoryID));
        showEditForm(request,response);
    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id= Integer.parseInt(request.getParameter("id"));
        String name= request.getParameter("name");
        double price= Double.parseDouble(request.getParameter("price"));
        int quantity= Integer.parseInt(request.getParameter("quantity"));
        String color= request.getParameter("color");
        String desc= request.getParameter("desc");
        int category= Integer.parseInt(request.getParameter("category"));
        daoManger.productDAO.updateProduct(new Product(id,name,price,quantity,color,desc,category));
        showEditForm(request,response);
    }
    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id= Integer.parseInt(request.getParameter("id"));
        daoManger.productDAO.deleteProduct(id);
        showEditForm(request,response);
    }


    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<Product> productList=daoManger.productDAO.selectAllProduct();
        RequestDispatcher dispatcher=request.getRequestDispatcher("index.jsp");
        request.setAttribute("productList",productList);
        dispatcher.forward(request,response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher=request.getRequestDispatcher("index.jsp");
        dispatcher.forward(request,response);
    }

}
