<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<head>
    <meta charset="ISO-8859-1">
    <title>View Student List</title>

    <link rel="stylesheet"
        	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
        <script
        	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script
        	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script
            src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

    <style>
        a{
            color: white;
        }
        a:hover {
            color: white;
            text-decoration: none;
        }
        .form-control{
          margin-top:30px
        }
        .btn{
          margin-left:10px;
          margin-top:10px;
          padding-top: 5px;
          padding-buttom: 5px;
          padding-right: 5px;
          padding-left: 5px;
          
         }
    </style>

</head>
<body>



    <div class="container">
   <form:form action="/search" method="post" modelAttribute="search"> 
    
       <div class="row">
            	<div class="form-group col-md-12">
            		<label class="col-md-3" for="name"></label>
            		<div class="col-md-6">
            		    <form:input type="text" path="name" id="name"
            		        class="form-control input-sm" required="required" />
            		</div>
            	</div>
            </div>
      

      <button type="submit" value="Register" class="btn btn-success">Search</button>
            	

</form:form>
        <h1 class="p-3"> Student List</h1>
      


        <form:form>

            <table class="table table-bordered">
            	<tr>
            		<th>Id</th>
            		<th>Name</th>
            		<th>State</th>
            		<th>City</th>
            		<th>Standard</th>
            		<th>Grade</th>
            		<th>Total Marks</th>
            	</tr>

            	<c:forEach var="student" items="${studentList}">
                    <tr>
                		<td>${student.id}</td>
                		<td>${student.name}</td>
                		<td>${student.standard}</td>
                		<td>${student.city}</td>
                		<td>${student.grade}</td>
                		<td>${student.marks}</td>
                		<td>${student.state}</td>
                		<td><button type="button" class="btn btn-success">
                		    <a href="/editStudent/${student.id}">Edit</a>
                		</button></td>
                		<td><button type="button" class="btn btn-danger">
                			<a href="/deleteStudent/${student.id}">Delete</a>
                		</button></td>
                	</tr>

            	</c:forEach>

            </table>

        </form:form>

        <button type="button" class="btn btn-primary btn-block">
        	<a href="/addStudent">Add New Student</a>
        </button>

    </div>

    <script th:inline="javascript">
                window.onload = function() {

                    var msg = "${message}";
                    console.log(msg);
                    if (msg == "Save Success") {
        				Command: toastr["success"]("Student added successfully!!")
        			} else if (msg == "Delete Success") {
        				Command: toastr["success"]("Student deleted successfully!!")
        			} else if (msg == "Delete Failure") {
        			    Command: toastr["error"]("Some error occurred, couldn't delete user")
        			} else if (msg == "Edit Success") {
        				Command: toastr["success"]("Student updated successfully!!")
        			}

        			toastr.options = {
                          "closeButton": true,
                          "debug": false,
                          "newestOnTop": false,
                          "progressBar": true,
                          "positionClass": "toast-top-right",
                          "preventDuplicates": false,
                          "showDuration": "300",
                          "hideDuration": "1000",
                          "timeOut": "5000",
                          "extendedTimeOut": "1000",
                          "showEasing": "swing",
                          "hideEasing": "linear",
                          "showMethod": "fadeIn",
                          "hideMethod": "fadeOut"
                        }
        	    }
            </script>

</body>

</html>