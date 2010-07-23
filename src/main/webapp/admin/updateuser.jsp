<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="../css/adminform.css" rel="stylesheet" type="text/css" >

        <script>
            function updatehomefrm(){
                
               if(document.userfrm.password.value==''){
                    alert("Please enter user password");
                    document.userfrm.password.focus();
                    return false ;
               }

               if(document.userfrm.confirmpassword.value==''){
                    alert("Please enter user confirm password");
                    document.userfrm.confirmpassword.focus();
                    return false ;
               }
               if(document.userfrm.password.value!=document.userfrm.confirmpassword.value){
                   alert("Confirm password does not match");
                    document.userfrm.confirmpassword.focus();
                    return false ;

               }

                parent.updateAjaxUser(document.userfrm.userName.value,
                                   document.userfrm.password.value);
            }

        </script>

  </head>
  <body>

                   <div id="admin_input">
                                <form name="userfrm" action="" method="post">
                                    <center>
                                        <h3> Updated user details</h3>
                                        <table style="width:15em" width="100%" >

                                            <tr><td align="left">Username : <%=request.getParameter("username")%> </td></tr>
                                            <tr><td align="left" >&nbsp;</td></tr>

                                            <tr><td align="left">Password </td></tr>
                                            <tr><td align="left" ><input type="password" id="input_text" maxlength="50" name="password" style="width:14em"></td></tr><tr>

                                            <tr><td align="left">Confirm password </td></tr>
                                            <tr><td align="left" ><input type="password" id="input_text" maxlength="50" name="confirmpassword" style="width:14em"></td></tr>

                                            <tr><td align="left">&nbsp;</td></tr>
                                            <tr>
                                                <td align="left">
                                                    <input type="hidden" name="userName" value="<%=request.getParameter("username")%>">
                                                    <input type="button" id="input_button"  name="Update User" value="Update User" onclick="updatehomefrm()" >
                                                    <input type="button" id="input_button"  name="Cancel" value="Cancel" onclick="parent.updateuserwin.hide()" >
                                                </td>

                                            </tr>
                                        </table>
                                    </center>
                                    </form>
                    </div>

  </body>
</html>
