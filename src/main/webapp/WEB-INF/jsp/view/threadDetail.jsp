<!DOCTYPE html>
<html>
    <head>
        <title>Thread Deatil</title>
    </head>
    <body>
        <c:url var="logoutUrl" value="/logout"/>
        <form action="${logoutUrl}" method="post">
            <input type="submit" value="Log out" />
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
        <h2>Ticket #${thread.id}: <c:out value="${thread.title}" /></h2>
        <br /><br />
        <i>Customer Name - <c:out value="${ticket.customerName}" /></i><br /><br />
        <c:out value="${thread.content}" /><br /><br />
        <c:if test="${fn:length(thread.attachments) > 0}">
            Attachments:
            <c:forEach items="${thread.attachments}" var="attachment" varStatus="status">
                <c:if test="${!status.first}">, </c:if>
                <a href="<c:url value="/${thread.id}/attachment/${attachment.name}" />">
                    <c:out value="${attachment.name}" /></a>
            </c:forEach><br /><br />
        </c:if>
        <a href="<c:url value="/index" />">Return to list tickets</a>
    </body>
</html>
