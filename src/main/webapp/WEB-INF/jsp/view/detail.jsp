<!DOCTYPE html>
<html>
    <head>
        <title>Topic Detail</title>
    </head>
    <body>
        <div class="title">
            <a href="<c:url value="/index" />">Home page</a>
        </div><br/>
        <c:url var="logoutUrl" value="/logout"/>
        <form action="${logoutUrl}" method="post">
            <input type="submit" value="Log out" />
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
        <h2>Topic: ${topics.title}</h2>
        <i>Author - <c:out value="${topics.author}" /></i><br /><br />
        <h2>Content:</h2><br /><br />
        <c:out value="${topics.content}" /><br /><br />
        <h3>Reply:</h3>

    </body>
</html>
