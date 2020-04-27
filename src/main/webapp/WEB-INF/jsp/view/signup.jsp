<!DOCTYPE html>
<html lang="zh-HK">
    <head>
        <title>index</title>
        <meta name="description" content="index">
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <div class="wrapper">
            <div id="signupform" class="form">
                <form:form class="modal-content" enctype="multipart/form-data" modelAttribute="Users">
                    <form:label path="username">Username</form:label><br />
                    <form:input type="text" path="username" /><br /><br />
                    <form:label path="password">Password</form:label><br />
                    <form:input type="password" path="password" /><br /><br />
                    <input type="submit" value="Sign Up" />
                </form:form>
            </div>
        </div>
    </body>

</HTML>