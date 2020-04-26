<!DOCTYPE html>
<html lang="zh-HK">
    <head>
        <title>index</title>
        <meta name="description" content="index">
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <div class="wrapper">
            <div class="poll">
                <h1>A Poll</h1>
                <ul>
                    <li><input name="poll_value" type="radio" value="option 1" />Option 1</li>
                    <li><input name="poll_value" type="radio" value="option 2" />Option 2</li>
                    <li><input name="poll_value" type="radio" value="option 3" />Option 3</li>
                    <li><input name="poll_value" type="radio" value="option 4" />Option 4</li>
                </ul>
                <input type="submit" value="Submit" />
            </div>
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