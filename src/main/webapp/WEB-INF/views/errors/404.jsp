<%@ page import="java.util.ResourceBundle" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="test" uri="http://www.springframework.org/tags"%>
<%
    ResourceBundle res = ResourceBundle.getBundle("application");
    String version = res.getString("build.version");
%>
<!DOCTYPE html>
<html lang="${language}">
<head>
    <meta charset="UTF-8">
    <title><spring:message code="voj.error.404.title" text="Page Not Found" /> | ${websiteName}</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="${description}">
    <meta name="author" content="Haozhe Xie">
    <!-- Icon -->
    <link href="img/favicon.ico?v=<%=version%>" rel="shortcut icon" type="image/x-icon">
    <!-- StyleSheets -->
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css?v=<%=version%>" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.min.css?v=<%=version%>" />
    <link rel="stylesheet" type="text/css" href="css/flat-ui.min.css?v=<%=version%>" />
    <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css?v=<%=version%>" />
    <link rel="stylesheet" type="text/css" href="css/style.css?v=<%=version%>" />
    <link rel="stylesheet" type="text/css" href="css/misc/error.css?v=<%=version%>" />
    <!-- JavaScript -->
    <script type="text/javascript" src="js/jquery-1.11.1.min.js?v=<%=version%>"></script>
    <script type="text/javascript" src="js/bootstrap.min.js?v=<%=version%>"></script>
    <script type="text/javascript" src="js/md5.min.js?v=<%=version%>"></script>
    <!--[if lte IE 9]>
        <script type="text/javascript" src="js/jquery.placeholder.min.js?v=<%=version%>"></script>
    <![endif]-->
    <!--[if lte IE 7]>
        <link rel="stylesheet" type="text/css" href="css/font-awesome-ie7.min.css?v=<%=version%>" />
    <![endif]-->
    <!--[if lte IE 6]>
        <script type="text/javascript"> 
            window.location.href='<c:url value="/not-supported" />';
        </script>
    <![endif]-->
</head>
<body>
    <!-- Header -->
    <%@ include file="../include/header.jsp" %>
    <!-- Content -->
    <div id="content" class="container">
        <div class="row-fluid">
            <div class="span6">
                <img src="img/error.png?v=<%=version%>" alt="Error" />
            </div> <!-- .span6 -->
            <div id="error-message" class="span6">
                <h4><spring:message code="voj.error.404.page-not-found" text="Page not found!" /></h4>
                <p><spring:message code="voj.error.404.message" text="The requested URL was not found on this server." /></p>
                <button class="btn btn-primary" onclick="history.go(-1);"><spring:message code="voj.error.404.go-back" text="Go back" /></button>
            </div> <!-- .span6 -->
        </div> <!-- .row-fluid -->
    </div> <!-- #content -->
    <!-- Footer -->
    <%@ include file="../include/footer.jsp" %>
    <!-- Java Script -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script type="text/javascript" src="js/site.js?v=<%=version%>"></script>
    <c:if test="${GoogleAnalyticsCode != ''}">
    ${googleAnalyticsCode}
    </c:if>
</body>
</html>