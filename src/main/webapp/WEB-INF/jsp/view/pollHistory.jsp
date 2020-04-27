<!DOCTYPE html>
<html lang="zh-HK">
    <head>
        <title>Poll History</title>
        <meta name="description" content="Poll History">
    </head>

    <body>
        <%@ include file="header.jsp" %>
        <div class="wrapper">
            <span class="pollhistory_title">
                <h1>Poll History</h1>
            </span>


            <c:if test="${Polls_size >0}">
                <c:forEach items="${Polls}" var="poll">
                    <div class="pollhistory">
                        <c:set var="vote1" value="${0}"/>
                        <c:set var="vote2" value="${0}"/>
                        <c:set var="vote3" value="${0}"/>
                        <c:set var="vote4" value="${0}"/>
                        <c:set var="totalvote" value="${0}"/>
                        <h3>${poll.topic}</h3>
                        <ul>
                            <c:forEach items="${Votes}" var="vote">
                                <c:if test="${vote.pollid == poll.id}">
                                    <c:set var="totalvote"  value="${totalvote+1}"/>
                                <c:if test="${vote.choice == 1}">
                                    <c:set var="vote1"  value="${vote1+1}"/>
                                </c:if>
                                <c:if test="${vote.choice == 2 }">
                                    <c:set var="vote2"  value="${vote2+1}"/>
                                </c:if>
                                <c:if test="${vote.choice == 3}">
                                    <c:set var="vote3"  value="${vote3+1}"/>
                                </c:if>
                                <c:if test="${vote.choice == 4}">
                                    <c:set var="vote4"  value="${vote4+1}"/>
                                </c:if>
                                </c:if>
                            </c:forEach>
                            
                            <c:if test="${poll.option1 != null}">
                                <li style="background: linear-gradient(90deg, #E1C4FF <c:out value="${vote1/totalvote*100}"/>%, #EEEEEE <c:out value="${vote1/totalvote*100}"/>%);" data-percent="<c:out value="${vote1/totalvote*100}"/>">
                                    <span><c:out value="${vote1}"/></span>${poll.option1}</li>
                                </c:if>

                            <c:if test="${poll.option2 != null}">
                                <li style="background: linear-gradient(90deg, #E1C4FF <c:out value="${vote2/totalvote*100}"/>%, #EEEEEE <c:out value="${vote2/totalvote*100}"/>%);" data-percent="<c:out value="${vote2/totalvote*100}"/>">
                                    <span><c:out value="${vote2}"/></span>${poll.option2}</li>
                                </c:if>

                            <c:if test="${poll.option3 != null}">
                                <li style="background: linear-gradient(90deg, #E1C4FF <c:out value="${vote3/totalvote*100}"/>%, #EEEEEE <c:out value="${vote3/totalvote*100}"/>%);" data-percent="<c:out value="${vote3/totalvote*100}"/>">
                                    <span><c:out value="${vote3}"/></span>${poll.option3}</li>
                                </c:if>

                            <c:if test="${poll.option4 != null}">
                                <li style="background: linear-gradient(90deg, #E1C4FF <c:out value="${vote4/totalvote*100}"/>%, #EEEEEE <c:out value="${vote4/totalvote*100}"/>%);" data-percent="<c:out value="${vote4/totalvote*100}"/>">
                                    <span><c:out value="${vote4}"/></span>${poll.option4}</li>
                                </c:if>

                            <ul>
                                total votes: <c:out value="${totalvote}"/>
                                </div>
                            </c:forEach>
                        </c:if>
                        <c:if test="${Polls_size == 0}">
                            No poll history!
                        </c:if>


                        </body>

                        </HTML>