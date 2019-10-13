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
				
				<c:if test="${news !=null}">
					<form name="form1" id="form1" action="updatenew" method="POST">
				</c:if>
				<c:if test="${news == null}">
					<form name="form1" id="form1" action="addnew" method="POST">
				</c:if>
					<c:if test="${news !=null}">
						<div class="control-group">
						<h5 style="color: red; font-weight: bold">UPDATE NEW</h5>
						</div>
					</c:if>
					<c:if test="${news ==null}">
						<div class="control-group">
						<h5 style="color: red; font-weight: bold;">ADD NEW</h5>
					</div>	
					</c:if>
					 <c:if test="${news != null}">
           			<input type="hidden" name="id" value="<c:out value='${news.id}' />" />
         			 </c:if>            
					
					<div class="control-group">
						<label>Tiêu đề</label>
					</div>
					<div class="control-group">
						<div
							class="form-group floating-label-form-group controls mb-0 pb-2"
						>
							<input class="form-control" id="title" type="text"
								name="title" value="<c:out value='${news.title}'/>"
							>
						</div>
					</div>		
					<div class="control-group">
						<label>Mô tả</label>
					</div>
					<div class="control-group">
						<div
							class="form-group floating-label-form-group controls mb-0 pb-2"
						>
							 <input class="form-control" type="text" id="description" name="description" value="<c:out value='${news.description}' />" />
						</div>
					</div>
					<div class="control-group">
						<label>Nội dung</label>
					</div>
					<div class="control-group">
						<div
							class="form-group floating-label-form-group controls mb-0 pb-2"
						>
							<textarea id="content" name="content"><c:out value='${news.content}'/></textarea>
						</div>
					</div>
					<div class="control-group">
						<label>Tác giả</label>
					</div>
					<div class="control-group">
						<div
							class="form-group floating-label-form-group controls mb-0 pb-2"
						>
							<input class="form-control" type="text" id="author" name="author" value="<c:out value='${news.author}' />" />
						</div>
					</div>
					<div class="control-group">
						<label>Released</label>
					</div>
					<div class="form-group controls mb-0 pb-2"
						>
						<input type="checkbox" name="released" id="released"> Đã xuất bản
						</div>
						
					<div class="control-group">
						<div class="form-group controls mb-0 pb-2"></div>
					</div>
					<div id="success"></div>
					<div class="form-group">
						<c:if test="${news == null}">
						<button type="submit" class="btn btn-primary btn-sm"
							id="sendMessageButton"
						>Submit</button>
						</c:if>
						<c:if test="${news !=null}">
							<button type="submit" class="btn btn-primary btn-sm"
							id="sendMessageButton"
						>Update</button>
						</c:if>
					</div>
				</form>
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
.mce-notification {display: none !important;}
</style>
<script type="text/javascript">
tinymce.init({
	  selector: 'textarea#content',
	  height: 200,
	  menubar: true,
	  plugins: [
	    'advlist autolink lists link image charmap print preview anchor',
	    'searchreplace visualblocks code fullscreen',
	    'insertdatetime media table paste code help wordcount'
	  ],
	  toolbar: 'undo redo | formatselect | bold italic backcolor | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | removeformat | help',
	  content_css: [
	    '//fonts.googleapis.com/css?family=Lato:300,300i,400,400i',
	    '//www.tiny.cloud/css/codepen.min.css'
	  ]
	});
</script>
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
