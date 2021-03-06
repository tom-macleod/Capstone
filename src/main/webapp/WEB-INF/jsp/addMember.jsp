<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/nonMainPageHeader.jsp" />
	
	
	<div class="container-fluid">
	
	<div id="logo-div" class="center-block">
		<img id="logo" class="center-block img-responsive" src="img/tool_elevator_logo.png" />
	 </div>
	
	<h1 class="text-center">Create Member Account</h1>
	
	<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-6">
			<div id="member-form-id" class="bg-info">
				<h3 id="form-title" class="text-center">Member Information</h3>
				<div class="row">
					<div class="col-md-3"></div>
						<div class="col-md-6">
							<c:url value="/addMember" var="addMember" />
							<form id="add-member-form" action="${addMember}" method="POST">
								<label class="member-form-field">Full Name - <input type="text" name="name" placeholder="Full Name" /></label>
								<label class="member-form-field">Phone No - <input type="text" name="phone" placeholder="Phone Number" /></label>
								<label class="member-form-field">D License - <input type="text" name="license" placeholder="Drivers License" /></label>
								<button id="member-button" class="center-block btn btn-primary" type="submit">Create Member</button>
							</form>
						</div>
					<div class="col-md-3"></div>
				</div>	
			</div>
		</div>
		<div class="col-md-3"></div>
	</div>	
	
	
		
	</div>
	<script src="js/script.js"></script>
</body>
</html>