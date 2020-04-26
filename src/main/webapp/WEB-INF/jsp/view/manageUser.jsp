<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Users</title>
  </head>
  <link rel="stylesheet" type="text/css" href="css/style.css">
  <body>
    <h2>Manage User</h2>
    <table>
      <tr>
        <td>Username</td>
        <td>Role</td>
        <td>Status</td>
        <td>Action</td>
      </tr>
      <!-- For Each Users -->
      <c:forEach items="${Users}" var="user">
      <tr>
        <td>${user.username}</td>
        <td>${user.role}</td>
        <td>${user.status}</td>
        <c:if  test="${!user.role.equals('ROLE_ADMIN')}"> 
            <c:if test="${user.status.equals('banned')}">
            <td><button>Unban</button></td>
            </c:if>
            <c:if test="${user.status.equals('normal')}">
            <td><button>Ban</button></td>
            </c:if>
        </c:if>
      </tr>
      </c:forEach>
      <!-- End of Dummy Data -->
    </table>
    <a href="../admin"><button>Return</button></a>
  </body>
</html>
