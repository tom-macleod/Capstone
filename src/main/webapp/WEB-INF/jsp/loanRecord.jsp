<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<title>Tool Elevator</title>
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
					<a href="${mainPage}"><span class="glyphicon glyphicon-home"></span>  Main Page</a>
				</li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="active">
					<c:url value="logout" var="logout" />
					<a href="${logout}"><span class="glyphicon glyphicon-log-out"></span>  Logout</a>
				</li>
			</ul>
			<p id="nav-text-welcome" class="navbar-text navbar-right">Welcome <c:out value="${loginCheck.username}" />!</p>
		 </div>	
	</nav>
	
	<div class="container-fluid">
	<h1 class="text-center">Loan Record</h1>
	
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<table class="table">
				<tr>
					<th class="table-title text-center loan-header"><span id="table-cart" class="center-block glyphicon glyphicon-briefcase"></span></th>
					<th class="table-title text-center loan-header">Patron</th>
					<th class="table-title text-center loan-header">Tool</th>
					<th class="table-title text-center loan-header">Due By</th>
				</tr>
				
				<c:forEach var="loan" items="${loanList}">
					<tr>
						<td class="text-center">
							<c:url value="/returnTool" var="returnTool" >
								<c:param name="toolInventoryId" value="${loan.toolInventoryId}"></c:param>
								<c:param name="toolName" value="${loan.toolName}"></c:param>
								<c:param name="patronName" value="${loan.patronName}"></c:param>
								<c:param name="memberLicense" value="${loan.memberLicense}"></c:param>
							</c:url>
							<a href="${returnTool}"><button type="button" class="btn btn-xs btn-danger">Return</button></a>
						</td>
						<td class="text-center"><c:out value="${loan.patronName} (${loan.memberLicense})" /></td>
						<td class="text-center"><c:out value="${loan.toolName}" /></td>
						<td class="text-center"><c:out value="${loan.dueDate}" /></td>
					</tr>
				</c:forEach>
			</table>
		</div>	
		<div class="col-md-2"></div>
	</div>
	
	
	</div>
	
<script src="js/script.js"></script>
</body>
</html>