<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<spring:eval expression="@propertyConfigurer.getProperty('application.properties')" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />

    <title>News</title>

    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet" type="text/css" media="screen">
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
</head>

<body>
    <div id="wrapper">
        <div id="top">
            <header id="header">
                <div class="three-fourth column-last">
                    <nav id="navigation">
                        <ul id="menu">
                            <li><a href="
                                <spring:eval expression="@propertyConfigurer.getProperty('catalog')" />"                >MAIN</a></li>
                            <li><a href="
                                <spring:eval expression="@propertyConfigurer.getProperty('catalog')" />/news/?page=1"   >NEWS</a></li>
                            <li><a href="
                                <spring:eval expression="@propertyConfigurer.getProperty('catalog')" />/search"         >EMPLOYEES</a></li>
                        <li><a href="
                                <spring:eval expression="@propertyConfigurer.getProperty('catalog')" />/contacts"       >CONTACTS</a></li>
                            <c:if test="${pageContext.request.userPrincipal.name == null}">
                                <li><a class="current" href="
                                    <spring:eval expression="@propertyConfigurer.getProperty('catalog')"/>/login"       >LOGIN</a></li>
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
                        <a>News</a>
                    </div>

                    <div class="one-half column-last alignright"></div>
                </div><!--end breadcrumbs-->
                <div class="double-separator"></div>
            </section>
        </div><!--end top-->

        <div class="centered-wrapper">
            <div class="three-fourth column-last">

                        <div class="team-text">
                            <h1 id="newsTitle0">${title}</h1>
                            <span id="newsDate">${date}</span>
                            <span id="newsAuthor"> - ${author}</span>
                            <p id="newsText0" style="font-size: 10pt">${article}</p>
                        </div>

            </div>
        </div><!--end centered-wrapper-->

        <div class="centered-wrapper">

            <footer id="footer">
                <div class="double-separator"></div>
            </footer>

        </div><!--end centered-wrapper-->
    </div>
</body>
</html>
