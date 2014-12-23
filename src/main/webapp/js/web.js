function login() {
	
	var username = jQuery("#username").val(), 
		password = jQuery("#password").val();
	//alert(username); alert(password);
	jQuery.ajax({
			type : "POST",
			url : "loginverify",
			dataType : "json",
			
			data : {
				"username" : username,
				"password" : hex_md5(password)
			},
			success : function(data) {
				if (data["status"] == "0") {
					jQuery('.login-alert').fadeIn();
				} else {
					
					if(data["type"]=="admin"){
						location.href = "adminhomepage";
					} else if( data["type"]=="teacher") {
<<<<<<< HEAD
						location.href = "teacherhomepage"
=======
						location.href = "teacherindex"
					} else if( data["type"]=="student") {
						location.href = "stuhomepage"
>>>>>>> 88cc9d7c7c86f167adf9f7557d5cafa47f3e2be8
					}
				}
			}
		});
}