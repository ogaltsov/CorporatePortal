<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />

    <title>Main Page</title>

    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet" type="text/css" media="screen">
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" type="text/css">


    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script src="<c:url value="/resources/js/custom.js"/>"></script>

</head>

<body>
<div id="wrapper">
    <div id="top">
        <header id="header">
            <div class="one-fourth">
                        <div class="logo"><a href="/corpsite.com/"><img src="/resources/images/logo.png" alt="" /></a></div>
            </div><!--end one-fourth-->

            <div class="three-fourth column-last">
                <nav id="navigation">
                    <ul id="mainnav">
                        <li><a href="/corpsite.com/">MAIN</a></li>
                        <li><a href="/corpsite.com/">NEWS</a></li>
                        <li><a href="/corpsite.com/search/">EMPLOYEES</a></li>
                        <li><a href="/corpsite.com/">REQUESTS</a></li>
                        <li><a href="/corpsite.com/">CONTACTS</a></li>
                        <c:if test="${pageContext.request.userPrincipal.name == null}">
                            <li><a class="current" href="/corpsite.com/user/">LOGIN</a></li>
                        </c:if>

                        <c:if test="${pageContext.request.userPrincipal.name != null}">
                            <li><a class="current" href="/corpsite.com/user/">
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
                    <a href="/corpsite.com/">Home</a>
                </div>

                <div class="one-half column-last alignright">

                </div>
            </div><!--end breadcrumbs-->
            <div class="double-separator"></div>
        </section>
    </div><!--end top-->

    <div align="center" class="centered-wrapper">


        <div align="center" class="column-last">
            <div id="login-box" align="center">

                <p class="lead">Login with Username and Password</p>

                <c:if test="${not empty error}">
                    <div class="error">${error}</div>
                </c:if>
                <c:if test="${not empty msg}">
                    <div class="msg">${msg}</div>
                </c:if>

                <form class="form" name='loginForm'
                      action="<c:url value='j_spring_security_check'/>" method='POST' role="form">

                    <table>
                        <tbody>
                        <tr>
                            <td>User:</td>
                            <td><input class="form-control input-lg" type='text' name='username' value='' style="margin-left: 10px"></td>
                        </tr>
                        <tr>
                            <td>Password:</td>
                            <td><input class="form-control input-lg" type='password' name='password' style="margin-left: 10px" /></td>
                        </tr>
                        <tr>
                            <td colspan='2'><input  class="btn btn-lg btn-default" name="submit" type="submit"
                                                   value="LogIn" style="margin-top: 6px"/></td>
                        </tr>
                        </tbody>
                    </table>

                    <input type="hidden" name="${_csrf.parameterName}"
                           value="${_csrf.token}" />

                </form>
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