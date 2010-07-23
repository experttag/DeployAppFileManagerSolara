<%@ page language="java" %>
<%@ page errorPage="Debug.jsp" %>
<%@ page session="true" %>
<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="com.solara.utility.WebResourceHelper" %>
<%@ page import="com.solara.filesharing.*" %>
<%@ page import="java.util.*" %>


<%

 String baseUrl = WebResourceHelper.getBaseUrl(request);

 Properties prop = (Properties)session.getAttribute("userList");
 Enumeration propKeys = prop.keys();

        Object obj = session.getAttribute("login");
        if (obj == null) {
%>
<jsp:forward page="Invalid.html" />
<%        }
        LoginDir login = (LoginDir) obj;
        String user = login.getUser();
        String list = "";

        if (!user.equalsIgnoreCase("admin")) {
            list = login.getFileList();
        } else {
            list = login.getAllList();
        }

        String exp = "";
        Object ex_obj = request.getAttribute("exception");
        if (ex_obj != null) {
            exp = (String) ex_obj;
        }


//HTTP 1.1
        response.setHeader("Cache-Control", "no-cache");
//HTTP 1.0
        response.setHeader("Pragma", "no-cache");
//prevents caching at the proxy server
        response.setDateHeader("Expires", 0);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
    <HEAD>
        <TITLE>Solara communications :Directory View</TITLE>
        <link href="css/solarastyle.css" rel="stylesheet" type="text/css" media="screen">
        <script type="text/javascript" src="js/admin.js"></script>

         <link rel="stylesheet" href="windowfiles/dhtmlwindow.css" type="text/css" />
        <script type="text/javascript" src="windowfiles/dhtmlwindow.js"></script>
        <link rel="stylesheet" href="modalfiles/modal.css" type="text/css" />
        <script type="text/javascript" src="modalfiles/modal.js"></script>

         <script>

             var baseUrl = "<%=baseUrl%>";
             
             var username1="";
             var password1="";

                          
             function showfiles(){

             var i;
              var selectObj=document.getElementById("touser");
              var touser = "";
              
              for (i = (selectObj.length - 1); i>=0; i--) {
                touser = selectObj.options[i].value;
                //alert(touser);
                 if(document.getElementById(touser)!=null)
                    document.getElementById(touser).style.display="none";
                 }
                 document.getElementById("userblank").style.display="none";

                 touser = document.getElementById("touser").value;
                 if(document.getElementById(touser)==null)
                     document.getElementById("userblank").style.display="";
                 else
                     document.getElementById(touser).style.display="";

             }


             function setparams(){
                 document.getElementById("tousersend").value=document.getElementById("touser").value;
             }

             function download(file, user){
                 window.open("<%=baseUrl%>Download?file="+ file + "&user=" + user, "_blank" , "width=2,height=2,resizable=no,status=no,toolbar=no");
             }

             function deletefile(file, user){
                 if(confirm("This action will remove the file permanently from system. Are you sure you want to delete file")){
                    window.open("<%=baseUrl%>Delete.do?file="+ file + "&user=" + user, "_parent");
                 }
             }
             function downloadbyuser(file){
                 window.open("<%=baseUrl%>Download?file="+ file , "_blank","width=2,height=2,resizable=no,status=no,toolbar=no");
             }

             function deletefilebyuser(file){
                 if(confirm("This action will remove the file permanently from system. Are you sure you want to delete file")){
                    window.open("<%=baseUrl%>Delete.do?file="+ file , "_parent");
                 }
             }


           

        </script>

    </HEAD>
    <BODY>

<jsp:include page="common/header.jsp" />

       <center>
        <div id="home_back" >

        <div id="file_list">
            <H3>Welcome <%=user!=null&&user.equalsIgnoreCase("admin")?"Administrator":user %></H3>

            <%if (user.equalsIgnoreCase("admin")) {%>
            <div id="file_upload" style="">
                
                       Select user : <select id="touser" name="touser" style="background-color:#F47B20;width:6em;" onchange="javascript:showfiles()">
                            <%
                            String user1="" , pass1="" ;
                            while(propKeys.hasMoreElements()) {
                                user1 = (String)propKeys.nextElement();
                                pass1= (String)prop.get(user1);
                                %>
                                <option value="<%=user1%>" <%=user1.equalsIgnoreCase("admin")?"selected":"" %> ><%=user1%></option>
                            <%}%>                            
                        </select>
                       <br><br>
                       <a href="javascript:openadduser()">add user</a> |
                       <a href="javascript:openupdateuser()">update user</a> |
                       <a href="javascript:opendeleteuser()">delete user</a>
                        
            </div>
            <%}%>

            <P>               
                
                <%=list%>

                <div id='userblank' style="display:none">
                    <ul><li>User space does not exist!</li></ul>
                </div>
            </P>

            <BR> 
            <H3>Upload a new file</H3>
            <P>
                               
                
                <div id="file_upload">
                    <FORM ACTION="<%=baseUrl%>Upload.do" METHOD="POST" ENCTYPE="multipart/form-data" ONSUBMIT="javascript:setparams()">
                        <INPUT TYPE="FILE" NAME="example" ID="input_button" >
                        <br><br><INPUT TYPE="SUBMIT" NAME="button" VALUE="Upload" STYLE="width:6em;">
                        <input type="hidden" name="touser" id="tousersend" value="admin">
                    </FORM>
                </div><br>

                <br>The file larger than <%=session.getAttribute("maxFile")%> bytes cannot not be uploaded.
            </P>            
        </div>
        </div><br><br>
        </center>

 <jsp:include page="common/footer.jsp" />
    </BODY>
</HTML>
