<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.hibernate.been.News"%>
<%@page import="java.util.List"%>
<%@ include file="header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<!-- Contact Section -->
<section class="page-section" id="contact">
	<div class="container">
		<!-- Contact Section Form -->
		<!------list user------->
		<div class="row">
			<div class="col-lg-12 mx-auto" style="margin-top: 20px">
				<a href="addeditnew.jsp">Add New</a>
				<p>
					<%
						if (request.getAttribute("msg") != null) {
							out.println(request.getAttribute("msg"));
						}
					%>
				</p>
				Tuổi trẻ
				
				Tuấn Hồ Quang Hiếu
				
				
				<h3>List of News</h3>
				<div class="table-responsive">
					<table style="width: 100%">
						<thead>
							<tr>
								<th>ID</th>
								<th>Title</th>
								<th>Description</th>
								<th>Content</th>
								<th>Date</th>
								<th>Author</th>
								<th>Edit</th>
								<th>Delete</th>
							</tr>
						</thead>
						<c:forEach items="${listNew}" var="news">
							<tr>
								<td><c:out value="${news.id}" /></td>
								<td><c:out value="${news.title}" /></td>
								<td><c:out value="${news.description}" /></td>
								<td><c:out value="${news.content}" escapeXml="false" /></td>
								<td><fmt:formatDate value="${news.publisher}"
										var="formattedDate" type="date" pattern="MM-dd-yyyy"
									/> <c:out value="${formattedDate}" /></td>
								<td><c:out value="${news.author}" /></td>
								<td>
									<form action="<c:url value="editnew"/>" method="post">
										<input type="hidden" name="id" value="${news.id}"> <input
											type="submit" class="btn btn-primary" value="Edit"
										>
									</form>
								</td>
								<td>
									<form action="<c:url value="deletenew"/>" method="post">
										<input type="hidden" name="id" value="${news.id}"> <input
											class="btn btn-danger" id="btnDelete" type="submit"
											value="Delete" onclick="return confirm('Do you want to delete the news ?')"
										>
									</form>
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
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
</html>
