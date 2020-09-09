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
    <H1 class="container col-12 text-center"> Product 2</H1>
</header>

<main class="bd-masthead container col-12" id="content" role="main" style="padding-top:56px">
    <hr>
    <div class="container col-12">
        <div class="col-12 row container bg-white" style="margin-left: 12px">
            <div class="col-2">
            &nbsp; <input type="button" class="btn btn-primary btn-dark" value="Insert" data-toggle="modal" data-target="#insertModal">
                <div class="modal fade" id="insertModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Input Value</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form method="post" action="products">
                                    <input class="form-control" name="name" style="width:100%" type="text" value="${product.getProductName()}"><br>
                                    <input class="form-control" name="price" style="width:100%" type="text" value="${product.getProductPrice()}"><br>
                                    <input class="form-control" name="quantity" style="width:100%" type="number" value="${product.getProductQuantity()}"><br>
                                    <input class="form-control" name="color" style="width:100%" type="text" value=" ${product.getProductColor()}"><br>
                                    <input class="form-control" name="desc" style="width:100%" type="text" value="${product.getProductDesc()}"><br>
                                    <input class="form-control" name="category" style="width:100%" type="number" value="${product.getProductCategory()}"><br>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <input type="hidden" name="action" value="create">
                                <button type="submit" class="btn btn-primary">Save changes</button>
                            </div>
                            </form>
                        </div>
                    </div>
            </div>

        </div>
            <table class="table text-center col-sm-8 col-md-8 col-lg-8">
                <thead class="thead-dark">
                <tr class="" style="width:100%">
                    <th scope="col" style="width:6%">#</th>
                    <th scope="col" style="width:12%">Name</th>
                    <th scope="col" style="width:12%">Price</th>
                    <th scope="col" style="width:12%">Quantity</th>
                    <th scope="col" style="width:24%; max-width:24%;">Color</th>
                    <th scope="col" style="width:12%">Category</th>
                    <th scope="col" colspan="2" style="width:12%">Edit</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${productList}" var="product">
                    <c:out value="
                    <tr class=\"container\">
                        <td scope=\"row\">${product.getProductId()}</td>
                        <td scope=\"row\">${product.getProductName()}</td>
                        <td scope=\"row\">${product.getProductPrice()}</td>
                        <td scope=\"row\">${product.getProductQuantity()}</td>
                        <td scope=\"row\">${product.getProductColor()}</td>
                        <td scope=\"row\">${product.getProductCategory()}</td>
                    <td scope=\"row\">
                    <input type=\"button\" class=\"btn btn-primary btn-dark\" value=\"Edit\" data-toggle=\"modal\" data-target=\"#exampleModal${product.getProductId()}\"> </td>
                     <div class=\"modal fade\" id=\"exampleModal${product.getProductId()}\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"exampleModalLabel\" aria-hidden=\"true\">
                          <div class=\"modal-dialog\" role=\"document\">
                            <div class=\"modal-content\">
                              <div class=\"modal-header\">
                                <h5 class=\"modal-title\" id=\"exampleModalLabel\">Modal title</h5>
                                <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\">
                                  <span aria-hidden=\"true\">&times;</span>
                                </button>
                              </div>
                              <div class=\"modal-body\">
                                 <form method=\"post\" action=\"products\">
                                     <input class=\"form-control\" name=\"id\" style=\"width:100%\" readonly type=\"text\" value=\"${product.getProductId()}\"><br>
                                     <input class=\"form-control\" name=\"name\" style=\"width:100%\" type=\"text\" value=\"${product.getProductName()}\"><br>
                                     <input class=\"form-control\" name=\"price\" style=\"width:100%\" type=\"text\" value=\"${product.getProductPrice()}\"><br>
                                     <input class=\"form-control\" name=\"quantity\" style=\"width:100%\" type=\"number\" value=\"${product.getProductQuantity()}\"><br>
                                     <input class=\"form-control\" name=\"color\" style=\"width:100%\" type=\"text\" value=\" ${product.getProductColor()}\"><br>
                                    <input class=\"form-control\" name=\"desc\" style=\"width:100%\" type=\"text\" value=\"${product.getProductDesc()}\"><br>
                                    <input class=\"form-control\" name=\"category\" style=\"width:100%\" type=\"number\" value=\"${product.getProductCategory()}\"><br>
                              </div>
                              <div class=\"modal-footer\">
                                <button type=\"button\" class=\"btn btn-secondary\" data-dismiss=\"modal\">Close</button>
                                <input type=\"hidden\" name=\"action\" value=\"edit\">
                                <button type=\"submit\" class=\"btn btn-primary\">Save changes</button>
                              </div>
                              </form>
                            </div>
                          </div>
                        </div>

                    <td scope=\"row\">
                    <input type=\"button\" class=\"btn btn-primary btn-dark\" value=\"Delete\" data-toggle=\"modal\" data-target=\"#exampleModalDel${product.getProductId()}\">
                      <div class=\"modal fade\" id=\"exampleModalDel${product.getProductId()}\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"exampleModalLabel\" aria-hidden=\"true\">
                          <div class=\"modal-dialog\" role=\"document\">
                            <div class=\"modal-content\">
                              <div class=\"modal-header\">
                                <h5 class=\"modal-title\" id=\"exampleModalLabel\">Confirm Delete</h5>
                                <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\">
                                  <span aria-hidden=\"true\">&times;</span>
                                </button>
                              </div>
                              <div class=\"modal-body\">
                                 <form method=\"post\" action=\"products\">
                                     <input readonly class=\"form-control\" name=\"id\" style=\"width:100%\" readonly type=\"text\" value=\"${product.getProductId()}\"><br>
                                     <input readonly class=\"form-control\" name=\"name\" style=\"width:100%\" type=\"text\" value=\"${product.getProductName()}\"><br>
                                     <input readonly class=\"form-control\" name=\"price\" style=\"width:100%\" type=\"text\" value=\"${product.getProductPrice()}\"><br>
                                     <input readonly class=\"form-control\" name=\"quantity\" style=\"width:100%\" type=\"number\" value=\"${product.getProductPrice()}\"><br>
                                     <input readonly class=\"form-control\" name=\"color\" style=\"width:100%\" type=\"text\" value=\" ${product.getProductQuantity()}\"><br>
                                    <input readonly class=\"form-control\" name=\"desc\" style=\"width:100%\" type=\"text\" value=\"${product.getProductColor()}\"><br>
                                    <input readonly class=\"form-control\" name=\"Category\" style=\"width:100%\" type=\"number\" value=\"${product.getProductCategory()}\"><br>
                              </div>
                              <div class=\"modal-footer\">
                                <button type=\"button\" class=\"btn btn-secondary\" data-dismiss=\"modal\">Close</button>
                                <input type=\"hidden\" name=\"action\" value=\"delete\">
                                <button type=\"submit\" class=\"btn btn-primary\">Save changes</button>
                              </div>
                              </form>
                            </div>
                          </div>
                        </div>
                    </td>
                    </tr>
                    " escapeXml="false"/>
                </c:forEach>
                </tbody>
            </table>
            <div class="col-2">
                &nbsp; <input type="button" class="btn btn-primary btn-dark" value="Search" data-toggle="modal" data-target="#searchModal">
                <div class="modal fade" id="searchModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="searchModalTitle">Search Value</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form method="post" action="products">
                                    <input class="form-control" name="SearchBox_productName" style="width:100%" type="text" value="Name"><br>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                        <input type="hidden" name="action" value="search">
                                        <button type="submit" class="btn btn-primary">search</button>
                                    </div>
                                </form>
                        </div>
                    </div>
            </div>
        </div>
    </div>
</main>
<script src="" async defer></script>
</body>
</html>
