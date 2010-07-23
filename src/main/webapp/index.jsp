<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
   <title>Solara communications : file sharing</title>     
   <link href="css/solarastyle.css" rel="stylesheet" type="text/css" media="screen">
</head>
<body >
<jsp:include page="common/header.jsp" />

<center>
<div id="home_back" >

<h2>&nbsp;</h2>

<form action="Login.do" method="post">

<div id="login" >

<table border="0">
<tr  >
	<td colspan="2" align="left"><span style="font-size:1.1em;color:#FDBB30;letter-spacing:2px;font-weight:bold">File Share</span></td>
</tr>
<tr ><td >Username</td>
	<td ><input type="text" name="user" size="20" id="input_text"></td>
</tr>
<tr  ><td>Password</td>
	<td><input type="password" name="pass" size="20" id="input_text"></td>
</tr>
<tr  >
	<td colspan="2" align="right"><input type="submit" name="button" value="Submit" id="input_button"></td>
</tr>
</table>
</div>
<input type="hidden" name="method" value="login">
</form>
<br><br><br>
</div>

<jsp:include page="common/footer.jsp" />

</center>
</body>
</html>
