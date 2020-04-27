<!DOCTYPE html>
<head>
    <title>index</title>
    <meta name="description" content="index">
</head>
<body>
    <%@ include file="header.jsp" %>
    <c:if test="${poll.id > 0}">
        <c:set var="voted" value="${false}" />
        <c:forEach items="${votes}" var="vote">
            <c:if test="${poll.id == vote.pollid && pageContext.request.userPrincipal.name == vote.username}">
                <c:set var="voted" value="${true}" />
            </c:if>
        </c:forEach>
            <div class="wrapper">
                <a class="checkpollhistory" href="<c:url value="/pollHistory" />">>><c:if test="${voted == true}">You have voted!</c:if>Check Poll History here<<</a>
                <c:if test="${voted == false}">
                <div class="poll">
                    <h1><c:out value="${poll.topic}"/></h1>
                    <form:form  enctype="multipart/form-data" modelAttribute="voteForm">
                        <ul>
                            <c:if test="${poll.option1 != null}">
                                <li><form:radiobutton path="choice" value="1"/><c:out value="${poll.option1}" /></li>
                                </c:if>
                                <c:if test="${poll.option2 != null}">
                                <li><form:radiobutton path="choice" value="2"/><c:out value="${poll.option2}" /></li>
                                </c:if>
                                <c:if test="${poll.option3 != null}">
                                <li><form:radiobutton path="choice" value="3"/><c:out value="${poll.option3}" /></li>
                                </c:if>
                                <c:if test="${poll.option4 != null}">
                                <li><form:radiobutton path="choice" value="4"/><c:out value="${poll.option4}" /></li>
                                </c:if>
                        </ul>
                        <input id="pollid" name="pollid" type="hidden" value="<c:out value="${poll.id}"/>"/>
                        <security:authorize access="hasAnyRole('ROLE_ADMIN,ROLE_USER')">
                            <input type="submit" value="Submit" />
                        </security:authorize>
                    </form:form>
                </div>
            </div>
        </c:if>
    </c:if>
    <div class="wrapper">
        <c:if test="${poll.id == null}">
        <p style="text-align:center;">No poll here</p>
        </c:if>
        <div class="row">
            <div class="col-md-4"><a href="<c:url value="/lectureList" />"><img src="<c:url value="/resources/images/lecture.jpg"/>"></a></div>
            <div class="col-md-4"><a href="<c:url value="/labList" />"><img src="<c:url value="/resources/images/lab.jpg"/>"></a></div>
            <div class="col-md-4"><a href="<c:url value="/otherList" />"><img src="<c:url value="/resources/images/other.jpg"/>"></a></div>
        </div>
    </div>
</div>
</body>

</HTML>
