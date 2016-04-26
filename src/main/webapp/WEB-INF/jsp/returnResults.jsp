<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/nonMainPageHeader.jsp" />


<div class="container-fluid">

	 <div id="logo-div" class="center-block">
		<img id="logo" class="center-block img-responsive" src="img/tool_elevator_logo.png" />
	 </div>
	
	<h1 class="text-center">Tool Successfully Returned</h1>
	
	<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-6">
		
		
			<div id="checkout-div" class="bg-info">
				<h3 id="form-title" class="text-center">Fees</h3>
				<div class="row">
					<div class="col-md-3"></div>
						<div class="col-md-6">
						
						<table class="table">
							<tr>
								<th>Days Late Fee</th>
								<th>Clean/Coiled Fee</th>
								<th>Gasoline Fee</th>
								<th>Total Fee</th>
							</tr>
							<tr>
								<td><c:out value="$ ${lateFees}0" /></td>
								<td><c:out value="$ ${cleanFees}0" /></td>
								<td><c:out value="$ ${gasFees}0" /></td>
								<td><b><c:out value="$ ${totalFees}0" /></b></td>
							</tr>
						</table>
						
						
						
						</div>
						
						
					<div class="col-md-3"></div>
				</div>	
			</div>
		</div>
		<div class="col-md-3"></div>
	</div>	
	
	
	
	
			
	</div>
	<script src="js/script.js"></script>
</body>
</html>