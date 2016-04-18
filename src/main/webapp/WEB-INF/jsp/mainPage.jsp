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
		
		
		<p id="nav-text" class="navbar-text navbar-right">Main Page Navbar</p>
		
	</nav>
	
	
	<div class="container-fluid">
	<h1 class="text-center">Inventory Page</h1>
	
	<p>Username: <c:out value="${username}" /></p>
	<p>Password: <c:out value="${password}" /></p>

	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<table class="table">
				<tr>
					<th class="table-title">Tool Name</th>
					<th class="table-title text-center">Tool Description</th>
					<th class="table-title">Available</th>
				</tr>
				
				<c:forEach var="tool" items="${toolList}">
					<tr>
						<td><c:out value="${tool.toolName}" /></td>
						<td><c:out value="${tool.description}" /></td>
						<td class="text-center"><c:out value="${tool.numAvailable}" /></td>
					</tr>
				</c:forEach>
			</table>
		</div>	
		<div class="col-md-2"></div>
	</div>
	
	
	</div>
</body>

