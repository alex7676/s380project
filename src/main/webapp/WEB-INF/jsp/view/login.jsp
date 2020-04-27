<!DOCTYPE html>
<html lang="zh-HK">
    <head>
        <title>index</title>
        <meta name="description" content="index">
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <div class="wrapper">
<div id="loginform" class="form ">
    <form class="modal-content" action="login" method="POST">
        <label for="username">Username</label>
        <input type="text" name="username" id="username" placeholder="Username" required>
        <label for="password">Password</label>
        <input type="password" name="password" id="password" placeholder="Password" required>
        <input type="checkbox" id="remember-me" name="remember-me" />
        <label for="remember-me">Remember me</label>
        <input type="submit" value="Log In">
        Don't have an account?<a id="gosignup">Sign up here </a>OR<a id="back"> Back</a>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        <c:if test="${param.error != null}">
            <p id="error">Error!</p>
        </c:if>
    </form>
</div>
            </div>
        </div>
    </body>

</HTML>