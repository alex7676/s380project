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
    <form:form modelAttribute="createPollForm"  enctype="multipart/form-data"  method="POST">
      <form:label path="topic">Topic:</span><form:input type="text" path="topic" size="40"/><br>
      <p>Selection (Check boxes to enable):</p>
      <table>
        <tr>
          <td><input type="checkbox" id="box1" name="" value="" checked><form:input type="text" id="option1" path="option1" size="40" /></td>
        </tr>
        <tr>
          <td><input type="checkbox" id="box2" name="" value="" checked><form:input type="text" id="option2"  path="option2" size="40" /></td>
        </tr>
        <tr>
          <td><input type="checkbox" id="box3" name="" value="" checked><form:input type="text" id="option3" path="option3" size="40" /></td>
        </tr>
        <tr>
          <td><input type="checkbox" id="box4" name="" value="" checked><form:input type="text" id="option4"  path="option4" size="40" /></td>
        </tr>
      </table>
      <br><input type="submit" name="" value="Publish" onclick="validateOptions()">
    </form:form>
    <br><a href="../admin"><button>Return</button></a>
  </body>
  <script type="text/javascript">
    document.getElementById('box1').onchange = function() {
    document.getElementById('option1').disabled = !this.checked;
    document.getElementById('option1').value = "";
};

  document.getElementById('box2').onchange = function() {
  document.getElementById('option2').disabled = !this.checked;
  document.getElementById('option2').value = "";
};

  document.getElementById('box3').onchange = function() {
  document.getElementById('option3').disabled = !this.checked;
  document.getElementById('option3').value = "";
};

  document.getElementById('box4').onchange = function() {
  document.getElementById('option4').disabled = !this.checked;
  document.getElementById('option4').value = "";
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
