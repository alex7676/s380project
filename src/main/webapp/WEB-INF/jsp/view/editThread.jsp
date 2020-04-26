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
    <form class="" action="" method="post">
      <span>Title:</span><input type="text" name="title" value="" size="40"><br>
      <p>Content:</p>
      <textarea name="name" rows="8" cols="80"></textarea>
      <br><input type="file" name="" value="" multiple="multiple">
      <input type="submit" name="" value="Submit"> <input type="submit" name="" value="" onClick="deleteThread()">
    </form>
  </body>
  <script type="text/javascript">
    function deleteThread(){
      var confirmation = confirm("Are you sure to delete THREAD?");
      if(confirmation == true){
        //INSERT DELETE THREAD HERE
      }
      else{
        return false;
      }
    }
  </script>
</html>
