<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.hibernate.been.User"%>
<%@page import="java.util.List"%>
<%@ include file="header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Contact Section -->
<section class="page-section" id="contact">
	<div class="container">
		<!-- Contact Section Form -->
		<div class="row">
			<div class="col-lg-8 mx-auto" style="margin-top: 20px">
				<!-- To configure the contact form email address, go to mail/contact_me.php and update the email address in the PHP file on line 19. -->
				
				<c:if test="${user !=null}">
					<form name="form1" id="form1" action="update" method="POST">
				</c:if>
				<c:if test="${user == null}">
					<form name="form1" id="form1" action="add"
					method="POST"
				>
				</c:if>
					<c:if test="${user !=null}">
						<div class="control-group">
						<h5 style="color: red; font-weight: bold">UPDATE ADMIN</h5>
						</div>
					</c:if>
					<c:if test="${user ==null}">
						<div class="control-group">
						<h5 style="color: red; font-weight: bold;">REGISTER ADMIN</h5>
					</div>	
					</c:if>
					 <c:if test="${user != null}">
           			<input type="hidden" name="id" value="<c:out value='${user.id}' />" />
         			 </c:if>            
					<c:if test="${user ==null}">
					<div class="control-group">
						<label>Name</label>
					</div>
					<div class="control-group">
						<div
							class="form-group floating-label-form-group controls mb-0 pb-2"
						>
							<input class="form-control" id="username" type="text"
								name="userName" value="<c:out value='${user.userName}'/>"
							>
						</div>
					</div>
					</c:if>
					 <c:if test="${user != null}">
           			 <input type="hidden" name="userName" id="userName" value="<c:out value='${user.userName}' />" />
         			 </c:if>   
					
					
					<c:if test="${user.password1 ==null}">
					<div class="control-group">
						<label>Password</label>
					</div>
					<div class="control-group">
						<div
							class="form-group floating-label-form-group controls mb-0 pb-2"
						>
							<input class="form-control" id="password1" type="password"
								name="password1" value="<c:out value='${user.password1}'/>"
							>
						</div>
					</div>
					<div class="control-group">
						<label>Confirm Password</label>
					</div>
					<div class="control-group">
						<div
							class="form-group floating-label-form-group controls mb-0 pb-2"
						>
							<input class="form-control" id="password2" type="password"
								name="password2"
							>
						</div>
					</div>
					</c:if>
					<c:if test="${user != null}">
           			 <input type="hidden" name="password1" id="password1" value="<c:out value='${user.password1}' />" />
         			 </c:if> 
					
					
					<div class="control-group">
						<label>Email</label>
					</div>
					<div class="control-group">
						<div
							class="form-group floating-label-form-group controls mb-0 pb-2"
						>
							
							 <input class="form-control" type="text" id="email" name="email" value="<c:out value='${user.email}' />" />
						</div>
					</div>
					<div class="control-group">
						<label>Phone</label>
					</div>
					<div class="control-group">
						<div
							class="form-group floating-label-form-group controls mb-0 pb-2"
						>
							<input class="form-control" type="text" id="phone" name="phone" value="<c:out value='${user.phone}' />" />
						</div>
					</div>
					<div class="control-group">
						<label>City</label>
					</div>
					<div class="control-group">
						<div
							class="form-group floating-label-form-group controls mb-0 pb-2"
						>
							<input class="form-control" type="text" id="city" name="city" value="<c:out value='${user.city}' />" />
						</div>
					</div>
					<div class="control-group">
						<div class="form-group controls mb-0 pb-2"></div>
					</div>
					<div id="success"></div>
					<div class="form-group">
						<c:if test="${user == null}">
						<button type="submit" class="btn btn-primary btn-sm"
							id="sendMessageButton"
						>Submit</button>
						</c:if>
						<c:if test="${user !=null}">
							<button type="submit" class="btn btn-primary btn-sm"
							id="sendMessageButton"
						>Update</button>
						</c:if>
					</div>
				</form>
			</div>
		</div>
		<!------list user------->
		<c:if test="${user == null}">
		<div class="row">
			<div class="col-lg-8 mx-auto" style="margin-top: 20px">
				<h5>List of Administrator</h5>
				<% if(null !=request.getAttribute("addsuccess")){
					out.println("addsuccess");
				} %>
				<div class="table-responsive">
					<table style="width: 100%">
						<thead>
							<tr>
								<th>ID</th>
								<th>User_Name</th>
								<th>Email</th>
								<th>Phone</th>
								<th>City</th>
								<th>Edit</th>
								<th>Delete</th>
							</tr>
						</thead>
						<c:forEach items="${listUser}" var="user">
							<tr>
								<td><c:out value="${user.id}" /></td>
								<td><c:out value="${user.userName}" /></td>
								<td><c:out value="${user.email}" /></td>
								<td><c:out value="${user.phone}" /></td>
								<td><c:out value="${user.city}" /></td>
								<td>
									<form action="<c:url value="edit"/>" method="post">
			                        <input type="hidden" name="id" value="${user.id}">
			                        <input type="submit" class="btn btn-primary" value="Edit">
			                    	</form>
								</td>
								<td>
									 <form action="<c:url value="delete"/>" method="post">
                       				 <input type="hidden" name="id" value="${user.id}">
                        			 <input class="btn btn-danger" id="btnDelete" type="submit" value="Delete" onclick="return confirm('You delete items ?')">
                    				 </form>
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
		</c:if>
	</div>
</section>
<%@ include file="footer.jsp"%>
</body>

<style>
.floating-label-form-group label {
	opacity: 1 !important;
}

.bg-secondary {
	background-color: #000 !important;
}

.copyright {
	background-color: #000 !important;
}

.footer {
	background-color: rgba(5, 42, 62, 1) !important;
}
</style>
<script>
	$(document)
			.ready(
					function() {
						$('#form1')
								.submit(
										function(e) {
											var username = $('#username').val();
											var valid = true;
											$(".error").remove();
											if (username.length < 1) {
												$('#username')
														.after(
																'<span class="error" style="color:red">This field is required</span>');
												valid = false;
											} else {
												var regEx = /^[A-Za-z\s]+$/;
												var validName = regEx
														.test(username);
												if (!validName) {
													$('#username')
															.after(
																	'<span class="error" style="color:red">The name must be a characters and name Vietnamese without accents</span>');
													valid = false;
												}
											}
											
											return valid;
										});
					});
</script>
</html>
