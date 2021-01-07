<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
 <%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>

<html>

<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
        integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
	<title>List Customers</title>
</head>

<body>

    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/customer/list">Customer Tracker</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="${pageContext.request.contextPath}/customer/list">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item active">
                	<!-- Display add customer button if user is manager or admin -->
            		<security:authorize access="hasAnyRole('MANAGER', 'ADMIN')">
            			<a class="nav-link" href="${pageContext.request.contextPath}/customer/showFormForAdd">Add Customer</a>
             		</security:authorize>
                </li>
            </ul>
            
            <form:form action="search" method="GET" class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="search" placeholder="Search by name" name="theSearchName" aria-label="Search">
                <button class="btn btn-light my-2 my-sm-0 mr-2" type="submit">Search</button>
            </form:form>
        
             <!-- Logout button -->
			<form:form action="${pageContext.request.contextPath}/logout" method="POST" class="form-inline my-2 my-lg-0">
				<button class="btn btn-light my-2 my-sm-0" type="submit">Logout</button>
			</form:form>
        </div>
    </nav>
   	
   	<div class="container mt-4">
   	
   	<%-- 
   		Username :<security:authentication property="principal.username"/> <br>
		Roles : <security:authentication property="principal.authorities"/> 
	--%>
	
   		<table class="table">
        <thead>
            <tr>
            	<th scope="col">#</th>
                <th scope="col">First Name</th>
                <th scope="col">Last Name</th>
                <th scope="col">Email</th>
                <security:authorize access="hasAnyRole('MANAGER', 'ADMIN')">
                	<th scope="col">Action</th>
                </security:authorize>
            </tr>
        </thead>
        <tbody>
        	
        	<!-- initialize count -->
        	<c:set var="count" value="0" scope="page" />
        	
        	<!-- Loop through list -->
        	<c:forEach var="tempCustomer" items="${customers}">
				
					<!-- construct an "update" link with customer id -->
					<c:url var="updateLink" value="/customer/showFormForUpdate">
						<c:param name="customerId" value="${tempCustomer.id}" />
					</c:url>					

					<!-- construct an "delete" link with customer id -->
					<c:url var="deleteLink" value="/customer/delete">
						<c:param name="customerId" value="${tempCustomer.id}" />
					</c:url>					
        	
        		<!-- Increment count -->
        		<c:set var="count" value="${count+1}" scope="page" />
        		
	            <tr>
	            	
	            	<td>${count}</td>
                	<td> ${tempCustomer.firstName} </td>
					<td> ${tempCustomer.lastName} </td>
					<td> ${tempCustomer.email} </td>
					<td>
						
						<!-- Display update button if user is manager or admin, else hide -->
						<security:authorize access="hasAnyRole('MANAGER', 'ADMIN')">
							<a href="${updateLink}" class="btn btn-primary" >Update</a>
						</security:authorize>
						
						<!-- Display delete button if user is admin, else hide -->
						<security:authorize access="hasAnyRole('ADMIN')">
							<a href="${deleteLink}" class="btn btn-danger" 
						   		onclick="if (!(confirm('Are you sure you want to delete this customer?'))) return false">Delete</a>
						</security:authorize>
						   
					</td>
	            </tr>
	            
	            </c:forEach>
        </tbody>
    </table>
   	</div>
	
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
        crossorigin="anonymous"></script>
</body>

</html>









