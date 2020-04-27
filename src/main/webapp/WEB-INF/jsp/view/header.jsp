<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/default.css" />">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap-grid.min.css" />">
<meta charset="UTF-8">
<div id="header">
    <div class="wrapper">
        <div class="title">
            <a href="<c:url value="/index" />">Title</a>
        </div>
        <div class="content">
            <security:authorize access="!hasAnyRole('ROLE_ADMIN,ROLE_USER')">
                <a id="login" href="<c:url value="/login" />">Log In
                </a>
                <a id="register" href="<c:url value="/signup" />">
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
