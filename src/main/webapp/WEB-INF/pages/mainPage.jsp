<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<spring:eval expression="@propertyConfigurer.getProperty('application.properties')" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />

    <title>Main</title>

    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet" type="text/css" media="screen">
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script src="<c:url value="/resources/js/ajaxRequestNews.js" />"></script>
</head>

<body>
    <div id="url" style="display: none"><spring:eval expression="@propertyConfigurer.getProperty('domain')"/><spring:eval expression="@propertyConfigurer.getProperty('catalog')"/></div>

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
                    </div>

                    <div class="one-half column-last alignright"></div>
                </div><!--end breadcrumbs-->
                <div class="double-separator"></div>
            </section>
        </div><!--end top-->

        <div class="centered-wrapper">
            <%--==================  News  =======================--%>
            <div class="three-fourth column-last">
                <ul id="team">

                    <!---->
                    <li class="team-member">
                        <div class="team-text">
                            <h3 id="newsTitle0"></h3>
                            <span id="newsDate0"></span>
                            <p id="newsText0" style="font-size: 10pt"></p>
                        </div>
                    </li><!--end team-member-->
                    <!---->

                    <li class="team-member">
                        <div class="team-text">
                            <h3 id="newsTitle1"></h3>
                            <span id="newsDate1"></span>
                            <p id="newsText1" style="font-size: 10pt"></p>
                        </div>
                    </li><!--end team-member-->

                    <li class="team-member">
                    <div class="team-text">
                        <h3 id="newsTitle2"></h3>
                        <span id="newsDate2"></span>
                        <p id="newsText2" style="font-size: 10pt"></p>
                    </div>
                    </li><!--end team-member-->

                    <li class="team-member">
                        <div class="team-text">
                            <h3 id="newsTitle3"></h3>
                            <span id="newsDate3"></span>
                            <p id="newsText3" style="font-size: 10pt"></p>
                        </div>
                    </li><!--end team-member-->

                    <li class="team-member">
                        <div class="team-text">
                            <h3 id="newsTitle4"></h3>
                            <span id="newsDate4"></span>
                            <p id="newsText4" style="font-size: 10pt"></p>
                        </div>
                    </li><!--end team-member-->
                    <!---->

                </ul>
            </div>
            <%--=======================================================--%>
        </div><!--end centered-wrapper-->

        <div class="centered-wrapper">

            <footer id="footer">
                <div class="double-separator"></div>
            </footer>
        </div><!--end centered-wrapper-->
    </div>
</body>
</html>