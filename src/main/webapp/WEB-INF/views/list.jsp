<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>员工列表</title>

<% pageContext.setAttribute("path", request.getContextPath()); %>
<script type="text/javascript" src="${path }/static/js/jquery-3.5.1.min.js"></script>
<link href="${path }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="${path }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
<!-- 员工添加Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>

<div class="container">
	<!-- 标题 -->
	<div class="row">
		<div class="col-md-12">
			<h1>SSM-CRUD</h1>
		</div>
	</div>
	<!-- 操作按钮 -->
	<div class="row">
		<div class="col-md-4 col-md-offset-8">
			<button type="button" class="btn btn-primary" id="emp_add_modal_btn">添加</button>
			<button type="button" class="btn btn-danger">删除</button>
		</div>
	</div>
	<!-- 表格 -->
	<div class="row">
		<div class="col-md-12">
			<table class="table table-hover">
				<tr>
					<th>#</th>
					<th>姓名</th>
					<th>性别</th>
					<th>邮箱</th>
					<th>所属部门</th>
					<th>操作</th>
				</tr>
				<c:forEach items="${pageInfo.list }" var="emp">
					<tr>
						<th>${emp.empId }</th>
						<th>${emp.empName }</th>
						<th>${emp.gendef=="M"?"男":"女" }</th>
						<th>${emp.email }</th>
						<th>${emp.department.deptName }</th>
						<th>
							<button type="button" class="btn btn-primary btn-sm">
								<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
								编辑
							</button>
							<button type="button" class="btn btn-danger btn-sm">
								<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
								删除
							</button>
						</th>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<!-- 分页 -->
	<div class="row">
		<!-- 分页信息 -->
		<div class="col-md-6">
			当前第${pageInfo.pageNum }页，总共${pageInfo.pages }页，共有${pageInfo.total }条记录
		</div>
		<!-- 分页 -->
		<div class="col-md-6">
			<nav aria-label="Page navigation">
			  <ul class="pagination">
			  	<li><a href="${path }/emps?pn=1">首页</a></li>
			  	<c:if test="${pageInfo.hasPreviousPage}">
			  		 <li>
				      <a href="${path }/emps?pn=${pageInfo.pageNum - 1}" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
			  	</c:if>
			   
			    <c:forEach items="${pageInfo.navigatepageNums }" var="pageNumber">
			    	<c:if test="${pageNumber == pageInfo.pageNum }">
			    		<li class="active"><a href="#">${pageNumber }</a></li>
			    	</c:if>
			    	<c:if test="${pageNumber != pageInfo.pageNum }">
			    		<li><a href="${path }/emps?pn=${pageNumber }">${pageNumber }</a></li>
			    	</c:if>
			    </c:forEach>
			    <c:if test="${pageInfo.hasNextPage}">
			    	<li>
				      <a href="${path }/emps?pn=${pageInfo.pageNum + 1}" aria-label="Next">
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