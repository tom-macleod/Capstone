<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/nonMainPageHeader.jsp" />
	
	
	<div class="container-fluid">
	
	<div id="logo-div" class="center-block">
		<img id="logo" class="center-block img-responsive" src="img/tool_elevator_logo.png" />
	 </div>
	
	<c:choose>
		<c:when test="${errorType == 1}">
			<h1 class="text-center text-danger">Patron Is Unauthorized To Checkout This Many Tools</h1>
		</c:when>
		<c:when test="${errorType == 2}">
			<h1 class="text-center text-danger">Patron Is Unauthorized To Checkout Tools</h1>
		</c:when>
		<c:when test="${errorType == 3}">
			<h1 class="text-center text-danger">Patron Is Unauthorized To Checkout This Many Power Tools</h1>
		</c:when>
		<c:when test="${errorType == 4}">
			<h1 class="text-center text-danger">Patron Is Unauthorized To Checkout Tools</h1>
		</c:when>
	</c:choose>
	
	
	
	
	
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
		<c:choose>
			<c:when test="${errorType == 1}">
				<h3>Patron <span class="text-danger"><c:out value="${patronName}" /></span> has reached limit of tools allowed in basket.  Tools must be removed from basket before patron can check out tools.</h3>
			</c:when>
			<c:when test="${errorType == 2}">
				<h3>Patron <span class="text-danger"><c:out value="${patronName}" /></span> has reached limit of loaned tools.  Tools must be returned before patron can check out tools.</h3>
			</c:when>
			<c:when test="${errorType == 3}">
				<h3>Patron <span class="text-danger"><c:out value="${patronName}" /></span> has reached limit of power tools allowed in basket.  Power tools must be removed from basket before patron can check out tools.</h3>
			</c:when>
			<c:when test="${errorType == 4}">
				<h3>Patron <span class="text-danger"><c:out value="${patronName}" /></span> has reached limit of loaned power tools.  Power tools must be returned before patron can check out power tools.</h3>
			</c:when>
		</c:choose>
			
		</div>	
		<div class="col-md-2"></div>
	</div>
	
	
	
	
	</div>
	
</body>
</html>