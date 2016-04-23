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
	
	<h1 class="text-center">Checkout</h1>
	
	<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-6">
		
		
			<div id="checkout-div" class="bg-info">
				<h3 id="form-title" class="text-center">Loan Information</h3>
				<div class="row">
					<div class="col-md-3"></div>
						<div class="col-md-6">
							<h4 class="text-center checkout-text">Patron</h4>
							<p id="checkout-name" class="text-center checkout-name">Name: <c:out value="${patronName}" /></p>
							<p id="checkout-license" class="text-center checkout-name">Drivers License: <c:out value="${patronLicense}" /></p>
							
							<h4 class="text-center  checkout-text">Tools</h4>
							<table class="table">
								<c:forEach var="tool" items="${basketList}">
									<tr>
										<td>
											<p class="text-center"><c:out value="${tool.toolName}" /></p>
										</td>
									</tr>
								</c:forEach>
							</table>
							
							<c:url value="/confirmCheckout" var="finalizeCheckout" />
							<form action="${finalizeCheckout}" method="POST">
								<input type="hidden" value="${patronLicense}" name="patronLicense" /> 
								<button id="member-button" class="center-block btn btn-primary" type="submit">Confirm Checkout</button>
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