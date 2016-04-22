$(document).ready(function(){
	
	$("#login-form").validate({
		
		rules : {
			
			username : {
				required : true,
				lettersonly : true
			},
			password : {
				required : true
			}
		}
		
	});
	
	$("#add-member-form").validate({
		
		rules : {
			
			name : {
				required : true
			},
			username : {
				required : true,
				lettersonly : true
			},
			phone : {
				required : true,
				phoneUS : true
			},
			license : {
				required : true
			}
			
		}
		
	});
	
	$.validator.addMethod( "nowhitespace", function( value, element ) {
		return this.optional( element ) || /^\S+$/i.test( value );
	}, "No white space please" );
	
	$.validator.addMethod( "lettersonly", function( value, element ) {
		return this.optional( element ) || /^[a-z]+$/i.test( value );
	}, "Letters only please" );
	
	$.validator.addMethod( "phoneUS", function( phone_number, element ) {
		phone_number = phone_number.replace( /\s+/g, "" );
		return this.optional( element ) || phone_number.length > 9 &&
			phone_number.match( /^(\+?1-?)?(\([2-9]([02-9]\d|1[02-9])\)|[2-9]([02-9]\d|1[02-9]))-?[2-9]([02-9]\d|1[02-9])-?\d{4}$/ );
	}, "Please specify a valid phone number" );
	
	$("#nav-btn").click(function(event) {
		$("#login-form").submit();
	});
	
	
});
