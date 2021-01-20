<%@ page import="java.util.ResourceBundle" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%
    ResourceBundle res = ResourceBundle.getBundle("application");
    String BaseUrl = res.getString("url.base");
    String version = res.getString("build.version");
    session.setAttribute("BaseUrl",BaseUrl);
    session.setAttribute("version",version);
%>
<!DOCTYPE html>
<html lang="${language}">
<head>
    <meta charset="UTF-8">
    <title><spring:message code="voj.misc.worldwide.title" text="Change Language" /> | ${websiteName}</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="${description}">
    <meta name="author" content="Haozhe Xie">
    <!-- Icon -->
    <link href="img/favicon.ico?v=${version}" rel="shortcut icon" type="image/x-icon">
    <!-- StyleSheets -->
    <link rel="stylesheet" type="text/css" href="${BaseUrl}/css/bootstrap.min.css?v=${version}" />
    <link rel="stylesheet" type="text/css" href="${BaseUrl}/css/bootstrap-responsive.min.css?v=${version}" />
    <link rel="stylesheet" type="text/css" href="${BaseUrl}/css/flat-ui.min.css?v=${version}" />
    <link rel="stylesheet" type="text/css" href="${BaseUrl}/css/font-awesome.min.css?v=${version}" />
    <link rel="stylesheet" type="text/css" href="${BaseUrl}/css/style.css?v=${version}" />
    <link rel="stylesheet" type="text/css" href="${BaseUrl}/css/misc/about.css?v=${version}" />
    <!-- JavaScript -->
    <script type="text/javascript" src="${BaseUrl}/js/jquery-1.11.1.min.js?v=${version}"></script>
    <script type="text/javascript" src="${BaseUrl}/js/bootstrap.min.js?v=${version}"></script>
    <script type="text/javascript" src="${BaseUrl}/js/md5.min.js?v=${version}"></script>
    <!--[if lte IE 9]>
        <script type="text/javascript" src="${BaseUrl}/js/jquery.placeholder.min.js?v=${version}"></script>
    <![endif]-->
    <!--[if lte IE 7]>
        <link rel="stylesheet" type="text/css" href="${BaseUrl}/css/font-awesome-ie7.min.css?v=${version}" />
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
    <div id="content">
        <div id="ribbon" style="height: 240px;"></div> <!-- #ribbon -->
        <div class="container">
            <div id="main-content">
                <h3><spring:message code="voj.misc.worldwide.other-languages" text="This site in other languages:" /></h3>
                <div class="row-fluid">
                    <div class="span3">
                        <ul class="languages">
                            <li><a href="javascript:void(0);" data-value="en_US">English</a></li>
                        </ul>
                    </div> <!-- .span3 -->
                    <div class="span3">
                        <ul class="languages">
                            <li><a href="javascript:void(0);" data-value="zh_CN">简体中文</a></li>
                        </ul>
                    </div> <!-- .span3 -->
                    <div class="span3">
                    </div> <!-- .span3 -->
                    <div class="span3">
                    </div> <!-- .span3 -->
                </div> <!-- .row-fluid -->
            </div> <!-- #main-content -->
        </div> <!-- .container -->
    </div> <!-- #content -->
    <!-- Footer -->
    <%@ include file="../include/footer.jsp" %>
    <!-- Java Script -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script type="text/javascript" src="${BaseUrl}/js/site.js?v=${version}"></script>
    <script type="text/javascript">
        $('a', '.languages').click(function() {
            var languageCode = $(this).attr('data-value');

            var request = {
                'language': languageCode
            };
            $.ajax({
                type: 'GET',
                url: '<c:url value="/worldwide.action" />',
                data: request,
                dataType: 'JSON',
                success: function(result) {
                    if ( result['isSuccessful'] ) {
                        var forwardUrl = '${forwardUrl}' || '<c:url value="/" />';
                        window.location.href = forwardUrl;
                    }
                }
            });
        });
    </script>
    <c:if test="${GoogleAnalyticsCode != ''}">
    ${googleAnalyticsCode}
    </c:if>
</body>
</html>