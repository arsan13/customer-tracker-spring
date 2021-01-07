<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
        integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
	<title>Save Customer</title>
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
            </ul>
            <!-- Logout button -->
			<form:form action="${pageContext.request.contextPath}/logout" method="POST" class="form-inline my-2 my-lg-0">
				<button class="btn btn-light my-2 my-sm-0" type="submit">Logout</button>
			</form:form>
         </div>
    </nav>

	<div class="container mt-4">
		<h1 class="display-5">Add/Update Customer </h1> <hr>
	
		<form:form action="saveCustomer" modelAttribute="customer" method="POST">
				
			<!-- need to associate this data with customer id -->
			<form:hidden path="id" />
				
            <div class="form-group">
                <label for="firstName">First Name</label>
                <form:input path="firstName" id="firstName" class="form-control" />
            </div>
            <div class="form-group">
                <label for="lastName">Last Name</label>
                <form:input path="lastName" id="lastName" class="form-control" />
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <form:input path="email" id="email" class="form-control" />
            </div>
         	<div class="buttons">
             	<button type="submit" class="btn btn-primary">Submit</button>
             	<button type="reset" class="btn btn-secondary">Reset</button>
         	</div>
    	</form:form>		
	
	</div>

</body>

</html>










