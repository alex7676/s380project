<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Poll</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
  </head>
  <body>
    <h1>Creating Polls</h1>
    <form name="createPoll" class="" action="" method="post">
      <span>Title:</span><input type="text" name="title" value="" size="40"><br>
      <span>Content:</span><br><textarea name="name" rows="8" cols="80"></textarea><br>
      <p>Selection (Check boxes to enable):
      <table>
        <tr>
          <td><input type="checkbox" id="box1" name="" value=""><input type="text" name="selection1" id="selection1" value="" size="40" disabled></td>
        </tr>
        <tr>
          <td><input type="checkbox" id="box2" name="" value=""><input type="text" name="selection2" id="selection2" value="" size="40" disabled></td>
        </tr>
        <tr>
          <td><input type="checkbox" id="box3" name="" value=""><input type="text" name="selection3" id="selection3" value="" size="40" disabled></td>
        </tr>
        <tr>
          <td><input type="checkbox" id="box4" name="" value=""><input type="text" name="selection4" id="selection4" value="" size="40" disabled></td>
        </tr>
      </table>
      <br><input type="submit" name="" value="Publish" onclick="validateOptions()">
    </form>
  </body>
  <script type="text/javascript">
    document.getElementById('box1').onchange = function() {
    document.getElementById('selection1').disabled = !this.checked;
    document.getElementById('selection1').value = "";
};

  document.getElementById('box2').onchange = function() {
  document.getElementById('selection2').disabled = !this.checked;
  document.getElementById('selection2').value = "";
};

  document.getElementById('box3').onchange = function() {
  document.getElementById('selection3').disabled = !this.checked;
  document.getElementById('selection3').value = "";
};

  document.getElementById('box4').onchange = function() {
  document.getElementById('selection4').disabled = !this.checked;
  document.getElementById('selection4').value = "";
};

function validateOptions() {
    if(createPoll.title.value == ""){
      alert('You have to provide a title');
      return false;
    }
    else if (createPoll.selection1.value == "" && createPoll.selection2.value == "" && createPoll.selection3.value == "" && createPoll.selection4.value == "") {
        alert('You have to provide at least one option');
        return false;
    }
    else {
        createPoll.submit();
    }
}
  </script>
</html>
