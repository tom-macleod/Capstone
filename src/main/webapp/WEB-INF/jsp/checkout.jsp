<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/nonMainPageHeader.jsp" />
	
	<div class="container-fluid">
	
	<h1 class="text-center">Checkout</h1>
	
	<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-6">
		
		
			<div id="checkout-div" class="bg-info">
				<h3 id="form-title" class="text-center">Loan Information</h3>
				<div class="row">
					<div class="col-md-3"></div>
						<div class="col-md-6">
							<h4 class="text-center checkout-text">Patron</h4>
							<p id="checkout-name" class="text-center checkout-name">Name: <c:out value="${patronName}" /></p>
							<p id="checkout-license" class="text-center checkout-name">Drivers License: <c:out value="${patronLicense}" /></p>
							
							<h4 class="text-center  checkout-text">Tools</h4>
							<table class="table">
								<tr>
									<th class="text-center">Tool</th>
									<th class="text-center">Qty</th>
								</tr>
								<c:forEach var="tool" items="${basketList}">
									<tr>
										<td>
											<p class="text-center"><c:out value="${tool.toolName}" /></p>
										</td>
										<td>
											<p class="text-center"><c:out value="${tool.quantity}" /></p>
										</td>
									</tr>
								</c:forEach>
							</table>
							
							<c:url value="/confirmCheckout" var="finalizeCheckout" />
							<form action="${finalizeCheckout}" method="POST">
								<input type="hidden" value="${patronLicense}" name="patronLicense" /> 
								<button id="member-button" class="center-block btn btn-primary" type="submit">Confirm Checkout</button>
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