$(document).ready(function function_name(argument) {
	// code logic ở đây
	$('#btn-login').click(function(){
		var email = $('#login_email').val();
		var password = $('#login_password').val();
		console.log("Kiểm tra: " + email + " - " + password);


		$.ajax({
		  method: "POST",
		  url: "http://localhost:8080/auth/sign-in",
		  data: { email: email, password: password }
		})
		  .done(function( result ) { // trả kết quả của đường dẫn này
		    console.log( "Data Saved: ",result );
		    if(result.data){
		    	alert("Đăng nhập thành công");
		    } else {
		    	alert("Đăng nhập thất bại");
		    }
		  });

	})
});