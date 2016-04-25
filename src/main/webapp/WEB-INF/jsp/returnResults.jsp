<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/nonMainPageHeader.jsp" />


<div class="container-fluid">
	
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