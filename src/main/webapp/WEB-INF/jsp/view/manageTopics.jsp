<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Topics</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
  </head>
  <body>
    <h1>Manage Topics</h1>
    <table>
      <tr>
        <th>ID</th>
        <td>Title</td>
        <td>Author</td>
        <td>time</td>
        <td>Files</td>
        <td>Action</td>
      </tr>
        <c:forEach items="topics" var="topic"><tr>
            <th> <a href="#">1</a></th>
            <td>${topic.title}</td>
            <td>${topic.author}</td>
            <td>${topic.time}</td>
            <td>
              <ul>
                <c:forEach items="${topic.file}" var="file"><li><a href="#DOWNLOAD">FILE 1</a></li></c:forEach>
              </ul>
            </td>
            <td><a href="#"><button type="button" name="button">Edit</button></a> <a href="#"><button type="button" name="button">Delete</button></a></td>
          </tr>
        </c:forEach>
    </table>
    <br><a href="../admin"><button>Return</button></a>
  </body>
</html>
