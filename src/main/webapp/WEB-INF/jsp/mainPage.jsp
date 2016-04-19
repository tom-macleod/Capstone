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
	
	
		
	
	
	<div class="row">
		<div class="col-md-1">
			<c:forEach var="tool" items="${basketList}">
				<c:out value="${tool.toolName}" />
			</c:forEach>	
		</div>
		<div class="col-md-10">
			<table class="table">
				<tr>
					<th class="table-title"><span id="table-cart" class="glyphicon glyphicon-shopping-cart"></span></th>
					<th class="table-title">Tool Name</th>
					<th class="table-title text-center">Tool Description</th>
					<th class="table-title">Stock</th>
					<th class="table-title">Loan</th>
				</tr>
				
				<c:forEach var="tool" items="${toolList}">
					<tr>
						<c:url value="/addTool" var="addTool" />
						<td>
							<form action="${addTool}" method="POST">
							<input type="hidden" name="toolId" value="${tool.toolId}" />
							<button type="submit" class="btn btn-sm btn-danger">Loan</button>
							</form>
						</td>	
						<td><c:out value="${tool.toolName}" /></td>
						<td><c:out value="${tool.description}" /></td>
						<td class="text-center"><c:out value="${tool.numAvailable}" /></td>
						<td class="text-center"><c:out value="${tool.loanPeriod} days" /></td>
					</tr>
				</c:forEach>
			</table>
		</div>	
		<div class="col-md-1"></div>
	</div>
	
	
	</div>
</body>

