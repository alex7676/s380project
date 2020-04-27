<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Post Thread</title>
</head>
<body>
    <c:url var="logoutUrl" value="/logout"/>
        <form action="${logoutUrl}" method="post">
            <input type="submit" value="Log out" />
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>

        <h1>Create New Topic</h2>

<div id="postthread">
        <form:form method="POST" enctype="multipart/form-data" modelAttribute="topicForm">
            <form:label path="title">Title:</form:label><br/>
            <form:input type="text" path="title" /><br/><br/>
            <form:label path="content">Content:</form:label><br/>
            <form:textarea path="content" rows="5" cols="30" /><br/><br/>
            <b>Categories:</b><br/>
            <form:radiobutton path="categories" value="lecture" />lecture<br/>
            <form:radiobutton path="categories" value="lab" />lab<br/>
            <form:radiobutton path="categories" value="other" />other<br/>
            <b>Attachments</b><br/>
            <input type="file" name="attachments" multiple="multiple"/><br/><br/>
            <input type="submit" value="Submit"/>
        </form:form>
        
</div>
</body>
</html>