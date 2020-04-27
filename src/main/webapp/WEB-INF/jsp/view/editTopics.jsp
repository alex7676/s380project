<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editing - THREAD NAME</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
  </head>
  <body>
    <h1>Editing Thread</h1>
    <form:form method="POST" enctype="multipart/form-data" modelAttribute="topicForm">
      <span>Title:</span><form:input path="title" type="text" name="title" value="${topic.title}" size="40"/><br>
      <p>Content:</p>
      <form:input  path="content"  name="name" value="${topic.content}" />
      <br><input type="file" name="" value="">
      <input type="submit" name="" value="Submit">
    </form:form>
  </body>

</html>
