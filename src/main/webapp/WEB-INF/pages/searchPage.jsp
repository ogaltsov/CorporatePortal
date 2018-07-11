<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<spring:eval expression="@propertyConfigurer.getProperty('application.properties')" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />

    <title>Search</title>

    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet" type="text/css" media="screen">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="<c:url value="/resources/css/tableStyle.css" />" rel="stylesheet">
    <script src="<c:url value="/resources/js/ajaxRequestTableConstructor.js" />"></script>

</head>

<body>
<div class="pageContainer" id="wrapper">
    <div id="top">
        <header id="header">
            <div class="three-fourth column-last">
                <nav id="navigation">
                    <ul id="menu">
                        <li><a href="<spring:eval expression="@propertyConfigurer.getProperty('catalog')" />"                >MAIN</a></li>
                        <li><a href="<spring:eval expression="@propertyConfigurer.getProperty('catalog')" />/news/?page=1"   >NEWS</a></li>
                        <li><a href="<spring:eval expression="@propertyConfigurer.getProperty('catalog')" />/search"         >EMPLOYEES</a></li>
                        <li><a href="<spring:eval expression="@propertyConfigurer.getProperty('catalog')" />/contacts"       >CONTACTS</a></li>
                        <c:if test="${pageContext.request.userPrincipal.name == null}">
                            <li><a class="current" href="
                                <spring:eval expression="@propertyConfigurer.getProperty('catalog')"/>/login"                >LOGIN</a></li>
                        </c:if>

                        <c:if test="${pageContext.request.userPrincipal.name != null}">
                            <li><a class="current" href="<spring:eval expression="@propertyConfigurer.getProperty('catalog')"/>/user/id?userName=${pageContext.request.userPrincipal.name}">
                                    ${pageContext.request.userPrincipal.name}
                            </a></li>
                        </c:if>
                    </ul>
                </nav><!--end navigation-->
            </div><!--end three-fourth-->
        </header>

        <section class="page-title">
            <div class="double-separator"></div>
            <div class="breadcrumbs">
                <div class="one-half alignleft">
                    <a href="<spring:eval expression="@propertyConfigurer.getProperty('catalog')" />">Home</a>
                    <img src="<c:url value="/resources/images/arrow.png"/>" alt="" />
                    <a>Search</a>
                </div>

                <div class="one-half column-last alignright"></div>
            </div><!--end breadcrumbs-->
            <div class="double-separator"></div>
        </section>
    </div><!--end top-->

    <div align="center" class="centered-wrapper">
        <div align="center" class="column-last">
            <div id="login-box" align="center">
                <div class="page" align="center">
                    <h1>Search for company employee</h1>
                    <p class="lead">Enter information about employee and the search returns matches</p>
                    <div align="center" class="form-inline">

                        <form class="form" id="form">
                            <input type=text class="form-control input-lg"
                                   id="firstName" placeholder="First name"
                                   maxlength="100">
                            <input type="text" class="form-control input-lg"
                                   id="secondName" placeholder="Second name"
                                   maxlength="100">
                            <input type="text" class="form-control input-lg"
                                   id="position" placeholder="Position"
                                   maxlength="100">
                            <input type="text" class="form-control input-lg"
                                   id="department" placeholder="Department"
                                   maxlength="100">

                            <button type="button" id="bth-search"
                                    class="btn btn-lg btn-default"
                                    onclick="return ajaxRequest('#tableBody',
                                            '<spring:eval expression="@propertyConfigurer.getProperty('domain')"/>' +
                                            '<spring:eval expression="@propertyConfigurer.getProperty('catalog')" />'+
                                            '/check')">
                                Search</button>
                        </form>
                    </div>

                    <div >
                        <div id="errorNullForm" class="error">You entered nothing!</div>
                        <div id="errorNoMatches" class="error">No match found!</div>
                    </div>
                    <div class="resultTableDiv" id="resultTableDiv">
                        <table id="excelDataTable" class="table" border="0">
                            <tbody id="tableBody">
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div><!--end centered-wrapper-->

    <div class="centered-wrapper">

        <footer id="footer">
            <div class="double-separator"></div>
        </footer><!--end footer-->

    </div><!--end centered-wrapper-->
</div>
</body>
</html>

