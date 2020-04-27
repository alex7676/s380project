<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Category Page</title>
        
</head>
<body>
        <div class="title">
            <a href="<c:url value="/index" />">Home page</a>
        </div>
	<h1>Lecture</h1>
	<h2>Total number of threads:${fn:length(topicsDatabase)}</h2><br/>
        <a href="<c:url value="/topics/lecture/createThread" />">Post A New Topic</a><br/><br/>

        <c:choose>
            <c:when test="${topicsDatabase == null}">
                <i>There are no tickets in the system.</i>
            </c:when>
            <c:otherwise>
                <c:forEach items="${topicsDatabase}" var="topics" varStatus="status">
                    Topic title:
                         <a href="<c:url value="/topics/lecture/detail/${topics.id}" />">
                        <c:out value="${topics.title}" /></a>
                    <br /><br />
                </c:forEach>
            </c:otherwise>
        </c:choose>
</body>
</html>