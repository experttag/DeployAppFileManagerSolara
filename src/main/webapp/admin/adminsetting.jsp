<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="css/adminform.css" rel="stylesheet" type="text/css" >

        <script>
            function updatehomefrm(){

                if(document.userfrm.filesize.value==''){
                    alert("Please enter filesize");
                    document.userfrm.filesize.focus();
                    return false ;
               }

               
                parent.updateSetting(document.userfrm.filesize.value);
            }

        </script>

  </head>
  <body>

                   <div id="admin_input">
                                <form name="userfrm" action="" method="post">
                                    <center>
                                        <h3> Update setting </h3>
                                        <table style="width:15em" width="100%" >

                                            <tr><td align="left">Max file size(in kb) </td></tr>
                                            <tr><td align="left" ><input type="text" id="input_text" maxlength="50" name="filesize" style="width:14em"></td></tr>

                                            <tr><td align="left">&nbsp;</td></tr>
                                            <tr>
                                                <td align="left">
                                                    <input type="button" id="input_button"  name="update" value="Update" onclick="updatehomefrm()" >
                                                    <input type="button" id="input_button"  name="Cancel" value="Cancel" onclick="parent.settingwin.hide()" >
                                                </td>

                                            </tr>
                                        </table>
                                    </center>
                                </form>
                    </div>

  </body>
</html>
