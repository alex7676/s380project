<link rel="stylesheet" type="text/css" href="<c:url value=" /resources/css/default.css" />">
<link rel="stylesheet" type="text/css" href="<c:url value=" /resources/css/bootstrap-grid.min.css" />">
<meta charset="UTF-8">
<div id="header">
    <div class="wrapper">
        <div class="title">
            <a href="<c:url value="/index" />">Title</a>
        </div>
        <div class="content">
            <security:authorize access="!hasAnyRole('ROLE_ADMIN,ROLE_USER')">
                <a id="login" onclick="document.getElementById('loginform').style.display = 'block'"
                    style="width:auto;">Log
                    In
                </a>
                <a id="register" onclick="document.getElementById('signupform').style.display = 'block'"
                    style="width:auto;">
                    Sign Up
                </a>
            </security:authorize>
            <security:authorize access="hasAnyRole('ROLE_ADMIN,ROLE_USER')">
                Hi ${pageContext.request.userPrincipal.name} !
                <c:url var="logoutUrl" value="/logout" />
                <form action="${logoutUrl}" method="post">
                    <input type="submit" value="Log out" />
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                </form>
                <security:authorize access="hasRole('ROLE_ADMIN')">
                    <a id="admin" href="admin"><button>Admin Page</button></a>
                </security:authorize>
            </security:authorize>
        </div>
    </div>
</div>

<!--loginform-->
<div id="loginform" class="form modal">
    <form class="modal-content animate" action="login" method="POST">
        <label for="username">Username</label>
        <input type="text" name="username" id="username" placeholder="Username" required>
        <label for="password">Password</label>
        <input type="password" name="password" id="password" placeholder="Password" required>
        <input type="checkbox" id="remember-me" name="remember-me" />
        <label for="remember-me">Remember me</label>
        <input type="submit" value="Log In">
        Don't have an accountï¼<a id="gosignup">Sign up hereï¼</a>OR<a id="back"> Backï¼</a>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        <c:if test="${param.error != null}">
            <p id="error">Login failed.</p>
        </c:if>
    </form>
</div>
<!--signupform-->
<div id="signupform" class="form modal">
    <form:form class="modal-content animate" enctype="multipart/form-data" modelAttribute="Users">
        <form:label path="username">Username</form:label><br />
        <form:input type="text" path="username" /><br /><br />
        <form:label path="password">Password</form:label><br />
        <form:input type="text" path="password" /><br /><br />
        <input type="submit" value="Sign Up" />
    </form:form>
</div>
<script src="<c:url value=" /resources/js/login.js" />"></script>