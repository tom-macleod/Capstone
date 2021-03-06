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

<body>
	
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<ul class="nav navbar-nav">
				<li class="active">
					<c:url value="/mainPage" var="mainPage" />
					<a href="${mainPage}"><span class="glyphicon glyphicon-home"></span>  Main Page</a>
				</li>
				<li class="active">
					<c:url value="loanRecord" var="loanRecord" />
					<a href="${loanRecord}"><span class="glyphicon glyphicon-th-list"></span>  Loan Record</a>
				</li>
				<li class="active">
					<c:url value="/members" var="members" />
					<a href="${members}"><span class="glyphicon glyphicon-user"></span>  All Members</a>
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