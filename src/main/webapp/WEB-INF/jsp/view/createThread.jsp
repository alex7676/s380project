<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Post Thread</title>
</head>
<body>
<h1>Create New Topic</h2>
<div id="postthread">
        <form action="" method="POST">
            <label for="title">Title:</label><br/>
            <input type="text" id="title" name="title" /><br/><br/>
            <label for="password">Content:</label><br/>
            <textarea id="Content" name="Content" row="5" col="30"></textarea><br/><br/>
            
            <b>Categories:</b><br/>
                <input type="radio" id="lecture" name="categories" value="lecture">
                <label for="lecture">Lecture</label><br>
                <input type="radio" id="lab" name="categories" value="lab">
                <label for="lab">Lab</label><br>
                <input type="radio" id="other" name="categories" value="other">
                <label for="other">Other</label><br/><br/>
            <b>Attachments</b><br/>
                <input type="file" name="attachments" multiple="multiple"/><br/><br/>
                <input type="submit" value="Submit"/>
        </form>

</div>
</body>
</html>