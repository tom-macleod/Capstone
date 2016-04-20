$(document).ready(function(){

	$("#login-form").validate({
		
		rules : {
			
			username : {
				required : true
			},
			password : {
				required : true
			}
		}
		
	});
	
	$("#nav-btn").click(function(event) {
		$("#login-form").submit();
	});
	
	
	$("#add-tool-button").click(function(event) {
		var quantity = $("#quantityQ").val();
		var stock = $("#stockQ").val();
		if(quantity > stock) {
			$("#add-tool-form").submit();
		} else {
			alert("Cannot add items to the basket than are in stock!");
		}
	});
	
	
});
