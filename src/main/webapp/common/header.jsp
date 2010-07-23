<%@ page import="com.solara.filesharing.*" %>
<%
 Object obj = session.getAttribute("login");
 String user = null;
 if (obj != null)
       user = ((LoginDir)obj).getUser();

 if(user==null) user="";
%>

<div id="header" >
    <div id="logo" style="float:left">
       <a href="http://solaracommunications.com/"><img src="images/logo.JPG" title="www.solaracommunications.com" style="border-style: none" ></a>
    </div>
    <div id="menu" style="float:right;">
        <a href="http://solaracommunications.com/">Home</a> 

        <%if(user.equalsIgnoreCase("admin")){%>
        | <a href="javascript:opensettinguser()">Setting</a>
        <%}%>

        <%if(obj!=null){%>
        | <a href="Login.do?method=logout">Logout</a>
        <%}%>
    </div>
</div>