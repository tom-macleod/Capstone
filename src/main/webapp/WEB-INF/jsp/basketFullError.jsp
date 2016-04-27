<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/nonMainPageHeader.jsp" />
	
	
	<div class="container-fluid">
	
	<div id="logo-div" class="center-block">
		<img id="logo" class="center-block img-responsive" src="img/tool_elevator_logo.png" />
	 </div>
	
	<h1 class="text-center text-danger">Patron Is Unauthorized To Checkout This Many Tools</h1>
	
	
	
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<h3>Patron <span class="text-danger"><c:out value="${patronName}" /></span> has reached limit of tools allowed in basket.  Tools must be removed from basket before patron can check out tools.</h3>
		</div>	
		<div class="col-md-2"></div>
	</div>
	
	
	
	
	</div>
	
</body>
</html>