<div id="header">
    <div class="wrapper">
        <div class="title">
            <a href="index.html">Title</a>
        </div>
        <div class="content">
            <c:if test="${pageContext.request.userPrincipal.name == null}">
                <a id="login" onclick="document.getElementById('loginform').style.display = 'block'" style="width:auto;">Log
                    In
                </a>
                <a id="register" onclick="document.getElementById('signupform').style.display = 'block'" style="width:auto;">
                    Sign Up
                </a>
            </c:if>
            <c:if test="${pageContext.request.userPrincipal.name != null}">
                Hi ${pageContext.request.userPrincipal.name} !
                <c:url var="logoutUrl" value="/logout"/>
                <form action="${logoutUrl}" method="post">
                    <input type="submit" value="Log out" />
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                </form>
            </c:if>
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
        Don't have an account？<a id="gosignup">Sign up here！</a>OR<a id="back"> Back！</a>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <c:if test="${param.error != null}">
            <p id="error">Login failed.</p>
        </c:if>
    </form>
</div>
<!--signupform-->
<div id="signupform" class="form modal">
    <form class="modal-content animate" enctype="multipart/form-data"
                   modelAttribute="ticketUser">
        <label for="username">Username</label>
        <input type="text" name="username" id="username" placeholder="Username" required>
        <label for="password">Password</label>
        <input type="password" name="password" id="password" placeholder="Password" required>
        <label for="re-password">Re-enter Password</label>
        <input type="password" name="re-password" id="re-password" placeholder="Re-enter Password" required>
        <input type="submit" value="Sign up" href="#">
    </form>
</div>
<script src="<c:url value="/resources/js/login.js"/>"></script>