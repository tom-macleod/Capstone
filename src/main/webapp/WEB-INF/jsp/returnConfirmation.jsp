<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/nonMainPageHeader.jsp" />


<div class="container-fluid">

	 <div id="logo-div" class="center-block">
		<img id="logo" class="center-block img-responsive" src="img/tool_elevator_logo.png" />
	 </div>
	
	<h1 class="text-center">Confirm Tool Return</h1>
	
	<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-6">
		
		
			<div id="checkout-div" class="bg-info">
				<h3 id="form-title" class="text-center">Inspection</h3>
				<div class="row">
					<div class="col-md-3"></div>
						<div class="col-md-6">
						
							<table class="table">
								<tr>
									<th class="text-center">Patron</th>
									<th class="text-center">Tool</th>
								</tr>
								<tr>
									<td>
										<p class="text-center"><c:out value="${patronName}" /></p>
									</td>
									<td>
										<p class="text-center"><c:out value="${toolName}" /></p>
									</td>
								</tr>
							</table>
						
						
						
							<c:url value="/confirmReturn" var="confirmReturn" />
							<form action="${confirmReturn}" method="POST">
								
								<h4 class="text-center">Is the tool clean and with cords coiled?</h4>
								<div id="checkbox-div" class="text-center">
								<label>Yes <input type="radio" name="cleanCheck" id="toolChoice1" value="true" /></label> <br>
								<label>No <input type="radio" name="cleanCheck" id="toolChoice2" value="false" /></label>
								</div>							
							
								<input type="hidden" value="${toolInventoryId}" name="toolInventoryId" /> 
								<input type="hidden" value="${dueDate}" name="dueDate" /> 
								<input type="hidden" value="${memberLicense}" name="memberLicense" /> 
								<button id="member-button" class="center-block btn btn-primary" type="submit" disabled>Confirm Checkout</button>
							</form>
							
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