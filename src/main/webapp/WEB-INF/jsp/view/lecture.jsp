<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Category Page</title>
</head>
<body>
	<h1>Lecture</h1>
	<h2>Total number of threads:n</h2><br/>
	<c:choose>
            <c:when test="${fn:length(threadDatabase) == 0}">
                <i>There are no threads in the system.</i>
            </c:when>
            <c:otherwise>
                <c:forEach items="${threadDatabase}" var="thread">
                    Thread ${thread.id}:
                    <a href="<c:url value="" />">
                        <c:out value="${thread.title}" /></a>
                    (customer: <c:out value="${thread.author}" />)
                    <br /><br />
                </c:forEach>
            </c:otherwise>
        </c:choose>
        
        <!---<table>
		<tr>
			<th>Author</th>
			<th>Message Topic</th>
		</tr>
		<tr>
			<td>User1</td>
			<td><a href=>Leature question1</a></td>
		</tr>
		<tr>
			<td>User2</td>
			<td><a href=>Leature question2</a></td>
		</tr>
	</table>--->
</body>
</html>