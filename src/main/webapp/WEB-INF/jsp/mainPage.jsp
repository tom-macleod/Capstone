<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<head>
	<title>Main Page</title>
</head>

<body>

	<h1>Inventory Page</h1>
	
	<c:forEach var="tool" items="${toolList}">
		<c:out value="${tool.toolName}" />
		<br>
	</c:forEach>

</body>

