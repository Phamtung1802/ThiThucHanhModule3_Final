<%--
  Created by IntelliJ IDEA.
  User: huy8895
  Date: 9/1/20
  Time: 8:52 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html class="no-js">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <script src="bootstrap/bootstrap.bundle.min.js"></script>
    <script src="bootstrap/bootstrap.min.js"></script>
    <link rel="stylesheet" href="bootstrap/bootstrap-grid.min.css">
    <link rel="stylesheet" href="bootstrap/bootstrap-reboot.min.css">
    <link rel="stylesheet" href="bootstrap/bootstrap.min.css">
    <title>Module 3 Final</title>

    <style>

    </style>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>

<body>
<header>
    <H1 class="container col-12 text-center"> Edit Product</H1>
</header>

<main class="bd-masthead container col-12" id="content" role="main" style="padding-top:56px">
    <hr>
    <div class="container col-12">
        <div class="col-12 row container bg-white" style="margin-left: 12px">
            <div class="col-2">
                &nbsp;
            </div>
            <div class=" text-center col-sm-8 col-md-8 col-lg-8">
                    <form method=\"post\" action=\"products\">
                        <input class=\"form-control\" name=\"id\" style=\"width:100%\" readonly type=\"text\" value=\"${product.getProductId()}\"><br>
                        <input class=\"form-control\" name=\"name\" style=\"width:100%\" type=\"text\" value=\"${product.getProductName()}\"><br>
                        <input class=\"form-control\" name=\"brand\" style=\"width:100%\" type=\"text\" value=\"${product.getProductPrice()}\"><br>
                        <input class=\"form-control\" name=\"price\" style=\"width:100%\" type=\"number\" value=\"${product.getProductPrice()}\"><br>
                        <input class=\"form-control\" name=\"image\" style=\"width:100%\" type=\"text\" value=\" ${product.getProductQuantity()}\"><br>
                        <input class=\"form-control\" name=\"line\" style=\"width:100%\" type=\"text\" value=\"${product.getProductColor()}\"><br>
                        <input class=\"form-control\" name=\"line\" style=\"width:100%\" type=\"text\" value=\"${product.getProductCategory()}\"><br>
                    </form>
            </div>
            <div class="col-2">
                &nbsp;
            </div>
        </div>
    </div>
</main>
<script src="" async defer></script>
</body>
</html>
