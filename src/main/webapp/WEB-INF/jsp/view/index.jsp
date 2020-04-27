<!DOCTYPE html>
<html lang="zh-HK">
    <head>
        <title>index</title>
        <meta name="description" content="index">
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <c:if test="${poll.id > 0}">
            <div class="wrapper">
                <a class="checkpollhistory" href="<c:url value="/pollHistory" />">>>Check Poll History here<<</a>
                <div class="poll">
                    <h1><c:out value="${poll.topic}"/></h1>
                    <ul>
                        <c:if test="${poll.option1 != null}">
                            <li><input name="poll_value" type="radio" value="option 1" /><c:out value="${poll.option1}"/></li>
                            </c:if>
                            <c:if test="${poll.option2 != null}">
                            <li><input name="poll_value" type="radio" value="option 2" /><c:out value="${poll.option2}"/></li>
                            </c:if>
                            <c:if test="${poll.option3 != null}">
                            <li><input name="poll_value" type="radio" value="option 3" /><c:out value="${poll.option3}"/></li>
                            </c:if>
                            <c:if test="${poll.option4 != null}">
                            <li><input name="poll_value" type="radio" value="option 4" /><c:out value="${poll.option4}"/></li>
                            </c:if>
                    </ul>
                    <input type="submit" value="Submit" />
                </div>
            </c:if>
            <div class="wrapper">
                <div class="row">
                    <div class="col-md-4"><a href="#"><img src="<c:url value="/resources/images/lecture.jpg"/>"></a></div>
                    <div class="col-md-4"><a href="#"><img src="<c:url value="/resources/images/lab.jpg"/>"></a></div>
                    <div class="col-md-4"><a href="#"><img src="<c:url value="/resources/images/other.jpg"/>"></a></div>
                </div>
            </div>
        </div>

    </body>

</HTML>