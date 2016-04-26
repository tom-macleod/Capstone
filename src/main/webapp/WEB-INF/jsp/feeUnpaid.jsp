<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/nonMainPageHeader.jsp" />
	
	
	<div class="container-fluid">
	
	<div id="logo-div" class="center-block">
		<img id="logo" class="center-block img-responsive" src="img/tool_elevator_logo.png" />
	 </div>
	
	<h1 class="text-center danger">Patron Is Unauthorized To Checkout Tools</h1>
	
	
	
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<h3>Patron [ <c:out value="${patronFull}" /> ] has outstanding fees.  Fees must be paid before patron can check out tools.</h3>
		</div>	
		<div class="col-md-2"></div>
	</div>
	
	
	
	
	</div>
	
</body>
</html>