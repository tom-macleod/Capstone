$(document).ready(function(){

	$("#login-form").validate({
		
		debug : true,
		rules : {
			
			username : {
				required : true
			},
			password : {
				required : true
			}
			
		}
		
	});
	
});
