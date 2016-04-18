<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<head>
	<title>Main Page</title>
	<link type="text/css" rel="stylesheet" href="css/style.css" />
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
	<script src="http://cdn.jsdelivr.net/jquery.validation/1.15.0/jquery.validate.min.js"></script>
	<script src="http://cdn.jsdelivr.net/jquery.validation/1.15.0/additional-methods.js "></script>
	<script src="https://cdn.jsdelivr.net/jquery.timeago/1.4.1/jquery.timeago.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>

<body class=" bg-warning">
	
	<nav class="navbar navbar-inverse">
		
		<form class="navbar-form navbar-right">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="Username">
				<input type="text" class="form-control" placeholder="Password">
			</div>
			<button  id="nav-btn" type="submit" class="btn btn-default btn-sm">Login</button>
		</form>
		<p class="navbar-text navbar-right">Librarian Login</p>
		
	</nav>
	
	
	
	
	<div class="container-fluid">
	<h1 class="text-center">Inventory Page</h1>
	
	<c:forEach var="tool" items="${toolList}">
		<c:out value="${tool.toolName}" />
		<br>
	</c:forEach>

	</div>
</body>

