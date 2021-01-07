<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Sign-in</title>
    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/sign-in/">
    
    <!-- Bootstrap core CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
     integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    
    <!-- Favicons -->
	<link rel="apple-touch-icon" href="/docs/5.0/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
	<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
	<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
	<link rel="manifest" href="/docs/5.0/assets/img/favicons/manifest.json">
	<link rel="mask-icon" href="/docs/5.0/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">
	<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon.ico">
	<meta name="theme-color" content="#7952b3">
    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
    
    <!-- Custom styles for this template -->
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login-style.css">
    
  </head>
  <body class="text-center">
    
	<main class="form-signin">
	  <form:form action="${pageContext.request.contextPath}/authenticateTheUser" method="POST">
	  
	    <!-- <img class="mb-4" src="/docs/5.0/assets/brand/bootstrap-logo.svg" alt="" width="72" height="57"> -->
	    <h1 class="h3 mb-3 fw-normal">Please sign in</h1>
	    
		 <!-- Place for messages: error, alert etc ... -->
	    <div class="form-group">
	        <div class="col-xs-15">
	            <div>
					
					<c:if test="${param.error != null}">		            
						<div class="alert alert-danger col-xs-offset-1 col-xs-10">
							Invalid credentials.
						</div>
					</c:if>
					
					<c:if test="${param.logout != null}">		            
						<div class="alert alert-success col-xs-offset-1 col-xs-10">
							You have been logged out.
						</div>
				    </c:if>
	
	            </div>
	        </div>
	    </div>
	    
	    <label for="username" class="visually-hidden">Username</label>
	    <input type="text" id="username" name="username" class="form-control" placeholder="Username" required autofocus>
	    
	    <label for="inputPassword" class="visually-hidden">Password</label>
	    <input type="password" id="inputPassword" name="password" class="form-control" placeholder="Password" required>
	    
	    <button class="w-100 btn btn-lg btn-primary" type="submit">Sign in</button>
	    
	  </form:form>
	</main>
    
  </body>
</html>