<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
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
					<c:url value="/createUser" var="addMember" />
					<a href="${addMember}"><span class="glyphicon glyphicon-user"></span>  Add Member</a>
				</li>
				<li class="active">
					<c:url value="/loanRecord" var="loanRecord" />
					<a href="${loanRecord}"><span class="glyphicon glyphicon-th-list"></span>  Loan Record</a>
				</li>
			</ul>
			<p id="nav-text-welcome" class="navbar-text navbar-right">Welcome <c:out value="${loginCheck.username}" />!</p>
		</div>
	</nav>
	
	
	<div class="container-fluid">
	<h1 class="text-center">Inventory Page</h1>
	
	
		
	
	
	<div class="row">
		<div id="basket-div" class="col-md-2 bg-info">
			<h2 class="text-center">Basket</h2>
			
			<table class="table table-bordered">
				<tr>
					<th class="basket-table-title text-center">Tool</th>
					<th class="basket-table-title text-center">Qty</th>
				</tr>
				
				<c:forEach var="tool" items="${basketList}">
					<tr>
						<td>
							<c:out value="${tool.toolName}" />
						</td>		
						<td class="text-center">
							<c:out value="${tool.quantity}" />
						</td>		
					</tr>			
				</c:forEach>
			
			</table>
			<h4 id="checkout-title" class="text-center">Select Patron</h4>
			<c:url value="/checkout" var="checkout" />
			<form action="${checkout}" method="POST">
				<div id="checkout-dropdown">
					<select id="select-checkout" class="form-control" name="patronFull">
						<c:forEach var="patron" items="${patronList}">
							<option value="${patron.name} ${patron.license}"><c:out value="Name: ${patron.name} License: ${patron.license}" /></option>
						</c:forEach>
					</select>
				</div>
				<br>
				
				
				<c:choose>
						<c:when test="${empty basketList}">
							<button type="submit" id="checkout-button" class=" center-block btn btn-sm btn-primary" disabled>Checkout</button>
						</c:when>
						<c:when test="${empty patronList}">
							<button type="submit" id="checkout-button" class=" center-block btn btn-sm btn-primary" disabled>Checkout</button>
						</c:when>
						<c:otherwise>
							<button type="submit" id="checkout-button" class=" center-block btn btn-sm btn-primary">Checkout</button>
						</c:otherwise>
				</c:choose>
				
				
			</form>
			
			
		</div>
		<div class="col-md-10">
			<table class="table">
				<tr>
					<th class="table-title"><span id="table-cart" class="glyphicon glyphicon-shopping-cart"></span></th>
					<th class="table-title">Tool Name</th>
					<th class="table-title text-center">Tool Description</th>
					<th class="table-title">Stock</th>
					<th class="table-title">Available</th>
					<th class="table-title">Loan</th>
				</tr>
				
				<c:forEach var="tool" items="${toolList}">
					<tr>
						<c:url value="/addTool" var="addTool" />
						<td>
							<form id="add-tool-form" action="${addTool}" method="POST">
								<input type="hidden" name="toolId" value="${tool.toolId}" />
								<button type="submit" class="btn btn-sm btn-danger">Loan</button>
							</form>
						</td>	
						<td><c:out value="${tool.toolName}" /></td>
						<td><c:out value="${tool.description}" /></td>
						<td class="text-center"><c:out value="${tool.stock}" /></td>
						<td class="text-center"><c:out value="${tool.numAvailable}" /></td>
						<td class="text-center"><c:out value="${tool.loanPeriod} days" /></td>
					</tr>
				</c:forEach>
			</table>
		</div>	
	</div>
	
	
	</div>
	<script src="js/script.js"></script>
</body>
</html>