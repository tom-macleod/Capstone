<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/nonMainPageHeader.jsp" />
	
	
	<div class="container-fluid">
	
	<div id="logo-div" class="center-block">
		<img id="logo" class="center-block img-responsive" src="img/tool_elevator_logo.png" />
	 </div>
	
	<h1 class="text-center">All Patrons</h1>
	
	
	
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<table id="table-loan" class="table">
				<tr>
					<th class="table-title text-center">Patron</th>
					<th class="table-title text-center">License</th>
					<th class="table-title text-center">Phone</th>
					<th class="table-title text-center">Fees</th>
					<th class="table-title text-center"><span class="glyphicon glyphicon-usd"></span></th>
				</tr>
				
				<c:forEach var="patron" items="${patronList}">
					<tr>
						<td class="text-center"><c:out value="${patron.name}" /></td>
						<td class="text-center"><c:out value="${patron.license}" /></td>
						<td class="text-center"><c:out value="${patron.phone}" /></td>
						<td class="text-center"><c:out value="$ ${patron.fees}0" /></td>
						<td>
							<c:url value="/payFine" var="payFine" >
								<c:param name="patronLicense" value="${patron.license}"></c:param>
							</c:url>
							<form action="${payFine}" method="POST" >
								<button type="submit" class="center-block btn btn-sm btn-success">Deficit Requital</button>
							</form>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>	
		<div class="col-md-2"></div>
	</div>
	
	
	
	
	</div>
	
</body>
</html>
	