<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工列表</title>
<!-- 
	web资源的路径问题，不是以/开始的都是相对路径，/代表站点根目录
 -->
<%
	pageContext.setAttribute("path", request.getContextPath());
%>
<link rel="stylesheet"
	href="${path}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css">
<script type="text/javascript"
	src="${path }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${path }/static/js/jquery-1.12.4.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h1>SSM-CRUD</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-md-4 col-md-offset-8">
				<button class="btn btn-primary">增加</button>
				<button class="btn btn-warning">删除</button>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover">
					<tr>
						<th>#</th>
						<th>Name</th>
						<th>Gender</th>
						<th>Email</th>
						<th>DeptName</th>
						<th>Operate</th>
					</tr>
					<c:forEach items="${pageInfo.list }" var="emp">
						<tr>
							<td>${emp.empId }</td>
							<td>${emp.empName }</td>
							<td>${emp.gender }</td>
							<td>${emp.email }</td>
							<td>${emp.department.deptName }</td>
							<td>
								<button class="btn btn-primary btn-sm">
									<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
									增加
								</button>
								<button class="btn btn-warning btn-sm">
									<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
									删除
								</button>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">
				当前${pageInfo.pageNum }页，总共${pageInfo.pages }页，总共${pageInfo.total }条记录
			</div>
			<div class="col-md-6">
				<nav aria-label="Page navigation">
				<ul class="pagination">
					<li><a href="${path }/emps?pn=1">首页</a></li>
					<c:if test="${pageInfo.hasPreviousPage }">
						<li>
							<a href="${path }/emps?pn=${pageInfo.pageNum-1}" aria-label="Previous"> 
								<span aria-hidden="true">&laquo;</span>
							</a>
						</li>
					</c:if>
					<c:forEach items="${pageInfo.navigatepageNums }" var="page">
						<c:if test="${page==pageInfo.pageNum }">
							<li class="active"><a href="${path }/emps?pn=${page}">${page}</a></li>
						</c:if>
						<c:if test="${page!=pageInfo.pageNum }">
							<li><a href="${path }/emps?pn=${page}">${page}</a></li>
						</c:if>
					</c:forEach>
					<c:if test="${pageInfo.hasNextPage }">
						<li>
							<a href="${path }/emps?pn=${pageInfo.pageNum+1 }" aria-label="Next">
								<span aria-hidden="true">&raquo;</span>
							</a>
						</li>
					</c:if>
					
					<li><a href="${path }/emps?pn=${pageInfo.pages}">末页</a></li>
				</ul>
				</nav>
			</div>
		</div>
	</div>
</body>
</html>