<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<head>
	<title>Welcome</title>
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
			<c:url value="/login" var="login" />
			<form  action="${login}" method="POST" id="login-form" class="navbar-form navbar-right">
				<div class="form-group">
					<input type="text" name="username" class="form-control" placeholder="Username" />
					<input type="password" name="password" class="form-control" placeholder="Password" />
				</div>
				<button id="nav-btn" type="submit" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-heart-empty"></span><span class="glyphicon glyphicon-heart-empty"></span> Login <span class="glyphicon glyphicon-heart-empty"></span><span class="glyphicon glyphicon-heart-empty"></span></button>
			</form>
			<p id="nav-text-lib-log" class="navbar-text navbar-right">Librarian Login</p>
		</div>
	</nav>
	
	
	<div class="container-fluid">
	<h1 class="text-center">Inventory Page</h1>
	
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<table class="table">
				<tr>
					<th class="table-title">Tool Name</th>
					<th class="table-title text-center">Tool Description</th>
					<th class="table-title">Stock</th>
					<th class="table-title">Loan</th>
				</tr>
				
				<c:forEach var="tool" items="${toolList}">
					<tr>
						<td><c:out value="${tool.toolName}" /></td>
						<td><c:out value="${tool.description}" /></td>
						<td class="text-center"><c:out value="${tool.numAvailable}" /></td>
						<td class="text-center"><c:out value="${tool.loanPeriod} days" /></td>
					</tr>
				</c:forEach>
			</table>
		</div>	
		<div class="col-md-2"></div>
	</div>
	
	
	</div>
	
	 <script src="js/script.js"></script>
</body>

