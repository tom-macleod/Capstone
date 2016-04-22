<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<head>
	<title>Main Page</title>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
	<script src="http://cdn.jsdelivr.net/jquery.validation/1.15.0/jquery.validate.min.js"></script>
	<script src="http://cdn.jsdelivr.net/jquery.validation/1.15.0/additional-methods.js "></script>
	<script src="https://cdn.jsdelivr.net/jquery.timeago/1.4.1/jquery.timeago.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<link type="text/css" rel="stylesheet" href="css/style.css" />
</head>

<body class=" bg-warning">
	
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<ul class="nav navbar-nav">
				<li class="active">
					<c:url value="/mainPage" var="mainPage" />
					<a href="${mainPage}">Main Page</a>
				</li>
			</ul>
			<p id="nav-text-welcome" class="navbar-text navbar-right">Welcome <c:out value="${loginCheck.username}" />!</p>
		 </div>	
	</nav>
	
	
	<div class="container-fluid">
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
								<button id="member-button" class="text-center btn btn-primary" type="submit">Create Member</button>
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
	