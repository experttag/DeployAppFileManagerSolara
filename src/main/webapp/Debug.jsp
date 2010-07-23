<%@ page language="java" %>
<%@ page isErrorPage="true" %>
<%@ page contentType="text/html; charset=us-ascii" %>
<%@ page import="java.io.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<!-- TITLE on te bar-->
<TITLE>
TestError: <%= exception.getClass()%>
</TITLE>
</HEAD>

<BODY>

<FONT SIZE=+1>
<B>
TestError: <%= exception.getClass()%>
</B>
</FONT>
<BR>

<HR SIZE=5 WIDTH="100%">

<!-- START OF CONTENTS OF THIS PAGE -->
<P ALIGN="CENTER">
<B><I><FONT SIZE=+3>
TestError: <%= exception.getClass()%>
</FONT></I></B>
</P>

<P>
<DL>
<DI>
<DT>Exception type:</DT>
<DD><%= exception.toString() %></DD>
</DI>
<DI>
<DT>Trace:</DT>
<FONT COLOR=red>
<DD><PRE>
<% exception.printStackTrace(new PrintWriter(out)); %>
</PRE></DD>
</FONT>
</DI>
</DL>
</P>
<!-- END OF CONTENTS OF THIS PAGE -->

<HR SIZE=5 WIDTH="100%">
<BR>
<BR>

</BODY>
</HTML>
