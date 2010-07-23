
            var adduserwin;

            //open window to add new user
            function openadduser(){
                adduserwin = dhtmlmodal.open("adduser", "iframe", "admin/adduser.html", "add new user",
                                 "width=460px,height=300px,center=1,resize=0,scrolling=1", "recal");

                adduserwin.onclose=function(){ //Run custom code when window is being closed (return false to cancel action):
                      return window.confirm("Do you want to close this form?");
                }
          }

          var updateuserwin;
          function openupdateuser(){
                 var touser = document.getElementById("touser").value;
                 updateuserwin= dhtmlmodal.open("updateuser", "iframe", "admin/updateuser.jsp?username=" +touser, "update new user",
                                 "width=460px,height=300px,center=1,resize=0,scrolling=1", "recal");

                updateuserwin.onclose=function(){ //Run custom code when window is being closed (return false to cancel action):
                      return window.confirm("Do you want to close this form?");
                }
           }



          function opendeleteuser(){
                 var touser = document.getElementById("touser").value;
                 if(touser=="admin")
                     alert("Admin user cannot be deleted");
                 else{
                     if(confirm("This action will delete user parmanently from system, Please confirm")){
                        parameters = "operation=3&username=" + encodeURI( touser);
                          getAjaxCall( baseUrl +"UserAction", parameters, "3");
                     }

                 }
                 
           }


            var settingwin;

            //open window to add new user
            function opensettinguser(){
                settingwin = dhtmlmodal.open("settingwin", "iframe", "Setting.do?method=opensetting", "Update setting",
                                 "width=460px,height=230px,center=1,resize=0,scrolling=1", "recal");

                settingwin.onclose=function(){ //Run custom code when window is being closed (return false to cancel action):
                      return window.confirm("Do you want to close this form?");
                }
          }


          function updateSetting(filesize){
            window.open("Setting.do?method=savesetting&maxFile="+filesize, "_parent");
            alert("Settting updated successfully");
            settingwin.hide();
          }


          //function to add new user
          function addAjaxUser(username,password){
              username1=username;
              password1=password;

             parameters = "operation=1&username=" + encodeURI( username)
                    + "&password=" +  encodeURI( password);

              getAjaxCall( baseUrl +"UserAction", parameters, "1");
              
          }

          //function to update user
          function updateAjaxUser(username,password){
              username1=username;
              password1=password;

             parameters = "operation=2&username=" + encodeURI( username)
                    + "&password=" +  encodeURI( password);

              getAjaxCall( baseUrl +"UserAction", parameters, "2");

          }

        //function to delete  user
          function deleteAjaxUser(username){
             username1=username;
             parameters = "operation=3&username=" + encodeURI( username);
              getAjaxCall( baseUrl +"UserAction", parameters, "3");

          }


    function getAjaxCall(url, parameters,operation){
		var req = null;
       
		//document.getElementById( 'displayinfotext' ).innerHTML="<h3>Searching...</h3>";
		if(window.XMLHttpRequest)
			req = new XMLHttpRequest();
		else if (window.ActiveXObject)
			req  = new ActiveXObject("Microsoft.XMLHTTP");

		req.onreadystatechange = function()
		{
			//document.getElementById( 'displayinfotext' ).innerHTML="<h3>Wait server...</h3>";
			if(req.readyState == 4)
			{
				if(req.status == 200){
                    var  res =req.responseText;
                    //alert(req.responseText);
                    if(operation=="1"){
                        refreshadd(res);
                    }
                    else if(operation=="2"){
                        refreshUpdate(res);

                    }else if(operation=="3"){
                        refreshDelete(res);
                    }


                    
				}
				else
				{
					alert("Error: returned status code " + req.status + " " + req.statusText);
				}
			}
		};

      /*req.open('POST', url, true);
      req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
      req.setRequestHeader("Content-length", parameters.length);
      req.setRequestHeader("Connection", "close");
      req.send(parameters);*/

      req.open('GET', url + "?" + parameters, true);
      req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
      //req.setRequestHeader("Content-length", parameters.length);
      req.setRequestHeader("Connection", "close");
      req.send(null);

	}


    function refreshadd(res){

          if(res=="0"){
              alert("Error while adding user. Please try again");
          }
          else if(res=="1"){                
               addSelectOption(document.getElementById("touser"), username1, username1, true);
               showfiles();
               alert("User added successfully");
               adduserwin.hide();
          }else{
              alert("User already exist");
              showfiles();
          }
              username1="";
              password1="";
          
      }

    function refreshUpdate(res){

          if(res=="0"){
              alert("Error while updating user. Please try again");
          }
          else if(res=="1"){
               removeSelectOption(document.getElementById("touser"));
               addSelectOption(document.getElementById("touser"), username1, username1, true);
               showfiles();
               alert("User updated successfully");
               updateuserwin.hide();
          }

                username1="";
                password1="";
      }


      function refreshDelete(res){

          if(res=="0"){
              alert("Error while deleting user. Please try again");
          }
          else if(res=="1"){
               removeSelectOption(document.getElementById("touser"));
               showfiles();
               alert("User deleted successfully");
               deleteuserwin.hide(); 
          }

              username1="";
              password1="";
      }

      

        function addSelectOption(selectObj, text, value, isSelected){
                if (selectObj != null && selectObj.options != null) {
                    selectObj.options[selectObj.options.length] = new Option(text, value, false, isSelected);
                }
        }

        function removeSelectOption(selectObj){
              var i;
              for (i = selectObj.length - 1; i>=0; i--) {
                if (selectObj.options[i].selected) {
                  selectObj.remove(i);
                }
            }
        }
