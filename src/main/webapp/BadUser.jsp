<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<TITLE>Solara communications : Invalid user information</TITLE>

<link href="css/solarastyle.css" rel="stylesheet" type="text/css" media="screen">
</HEAD>
<BODY>
    <jsp:include page="common/header.jsp" />
<center>

<div id="home_back">
<h2>&nbsp;</h2>
<div id="user_info" >
<H2>Invalid user information:</H2>
<P>
The user name and password are invalid.
Please go back to the starting page and try again.
<BR>
<CENTER>
<FORM ACTION="index.jsp" METHOD="GET">
<INPUT TYPE="SUBMIT" NAME="button" VALUE="Try Again" id="input_button">
</FORM>
</CENTER>
</P>
</div>
<br><br><br><br><br><br><br><br><br>
</div>


<jsp:include page="common/footer.jsp" />

</center>

</BODY>
</HTML>
