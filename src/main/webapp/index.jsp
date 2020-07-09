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
<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">员工添加</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal">
		  <div class="form-group">
		    <label for="add_emp_name" class="col-sm-2 control-label">员工姓名</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" name="empName" id="add_emp_name" placeholder="员工姓名">
		      <span class="help-block"></span>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="add_emp_email" class="col-sm-2 control-label">email</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" name="email" id="add_emp_email" placeholder="email">
		      <span class="help-block"></span>
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="col-sm-2 control-label">性别</label>
		    <div class="col-sm-10">
		      <label class="radio-inline">
				  <input type="radio" name="gendef" id="add_emp_gender1" value="M" checked="checked"> 男
			  </label>
			  <label class="radio-inline">
				  <input type="radio" name="gendef" id="add_emp_gender2" value="F"> 女
			  </label>
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="col-sm-2 control-label">部门名</label>
		    <div class="col-sm-4">
		        <select class="form-control" name="dId" id="add_dept_depts">
					  
				</select>
		    </div>
		  </div>
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" id="emp_add_save">保存</button>
      </div>
    </div>
  </div>
</div>
<!--end 员工添加Modal -->
<!-- 员工修改Modal -->
<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">员工修改</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal">
		  <div class="form-group">
		    <label for="add_emp_name" class="col-sm-2 control-label">员工姓名</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" name="empName" id="add_update_name" readonly="readonly">
		      <span class="help-block"></span>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="add_emp_email" class="col-sm-2 control-label">email</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" name="email" id="add_update_email" placeholder="email">
		      <span class="help-block"></span>
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="col-sm-2 control-label">性别</label>
		    <div class="col-sm-10">
		      <label class="radio-inline">
				  <input type="radio" name="gendef" id="add_update_gender1" value="M"> 男
			  </label>
			  <label class="radio-inline">
				  <input type="radio" name="gendef" id="add_update_gender2" value="F"> 女
			  </label>
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="col-sm-2 control-label">部门名</label>
		    <div class="col-sm-4">
		        <select class="form-control" name="dId" id="update_dept_depts">
					  
				</select>
		    </div>
		  </div>
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" id="emp_update_save">更新</button>
      </div>
    </div>
  </div>
</div>
<!--end 员工修改Modal -->
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
			<button type="button" class="btn btn-danger" id="delete_emps">删除</button>
		</div>
	</div>
	<!-- 表格 -->
	<div class="row">
		<div class="col-md-12">
			<table class="table table-hover" id="emps_table">
				<thead>
					<tr>
						<th>
							<input type="checkbox" id="emp_check_all"/>
						</th>
						<th>#</th>
						<th>姓名</th>
						<th>性别</th>
						<th>邮箱</th>
						<th>所属部门</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					
				</tbody>
			</table>
		</div>
	</div>
	<!-- 分页 -->
	<div class="row">
		<!-- 分页信息 -->
		<div class="col-md-6" id="page_info">
			
		</div>
		<!-- 分页 -->
		<div class="col-md-6" id="pages">
			
		</div>
	</div>
</div>
<script type="text/javascript">
	$(function(){
		to_page(1);
	});
	
	function to_page(pn){
		$.ajax({
			url:"${path}/emps",
			data:"pn="+pn,
			type:"get",
			success:function(res){
				build_emps_table(res);
				build_page_info(res);
				build_page_nav(res);
			},
			error:function(msg){
				
			}
		});
	}
	//解析员工数据
	function build_emps_table(res){
		$("#emps_table tbody").empty();
		var emps = res.extend.pageInfo.list;
		$.each(emps,function(index,item){
			var checkBoxTd = $("<td><input type='checkbox' class='emp_check_item'/></td>")
			var empIdTd = $("<td></td>").append(item.empId);
			var empNameTd = $("<td></td>").append(item.empName);
			var gendefTd = $("<td></td>").append(item.gendef=='M'?'男':'女');
			var emailTd = $("<td></td>").append(item.email);
			var deptNameTd = $("<td></td>").append(item.department.deptName);
			var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
							.append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
							.append("编辑");
			//添加员工id到button
			editBtn.attr("edit_id",item.empId);
			var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
						.append($("<span></span>").addClass("glyphicon glyphicon-trash"))
						.append("删除");
			var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
			$("<tr></tr>").append(checkBoxTd)
			.append(empIdTd)
			.append(empNameTd)
			.append(gendefTd)
			.append(emailTd)
			.append(deptNameTd)
			.append(btnTd)
			.appendTo("#emps_table tbody");
		})
	}
	//解析分页信息
	function build_page_info(res){
		$("#page_info").empty();
		$("#page_info").append("当前第"+res.extend.pageInfo.pageNum+"页，总共"+res.extend.pageInfo.pages+"页，共有"+res.extend.pageInfo.total+"条记录");
	}
	//解析分页条
	function build_page_nav(res){
		$("#pages").empty();
		var str = `
			<nav aria-label="Page navigation">
			  <ul class="pagination">
			  	<li><a onclick="to_page(1)">首页</a></li>
			`;
		if(res.extend.pageInfo.hasPreviousPage){
			var num = res.extend.pageInfo.pageNum - 1;
			str += `
				<li>
			      <a onclick="to_page(`+num+`)" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
			`;
		}
		$.each(res.extend.pageInfo.navigatepageNums,function(index,item){
			if(item  == res.extend.pageInfo.pageNum ){
				str += `<li class="active"><a href="#">`+item+`</a></li>`;
			}else{
				str += `<li><a onclick="to_page(`+item+`)">`+item+`</a></li>`;
			}
		});
		if(res.extend.pageInfo.hasNextPage){
			var num = res.extend.pageInfo.pageNum + 1;
			str += `
				<li>
			      <a onclick="to_page(`+num+`)" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
			    </li>
			`;
		}
		var pages = res.extend.pageInfo.pages;
		str += `
				<li><a onclick="to_page(`+pages+`)">末页</a></li>
			</ul>
		</nav>
		`;
		$("#pages").append(str);
	}
	//添加按钮
	$("#emp_add_modal_btn").click(function(){
		//重置表单
		$("#empAddModal form")[0].reset();
		//获取部门列表
		getDept("#add_dept_depts");
		//弹出模态框
		$("#empAddModal").modal({
			backdrop:"static"
		});
	});
	//获取部门列表
	function getDept(ele){
		$(ele).empty();
		$.ajax({
			url:"${path}/depts",
			type:"get",
			success:function(res){
				var depts = res.extend.depts;
				var str = "";
				$.each(depts,function(index,item){
					str += `<option value="` + item.deptId + `">` + item.deptName + `</option>`;
				});
				$(ele).append(str);
			}, 
			error:function(msg){
				
			}
		});
	}
	//提交保存
	$("#emp_add_save").click(function(){
		if(!validate_add_form()){
			return false;
		} 
		if($(this).attr("ajax-value") == "error"){
			return false;
		}
		$.ajax({
			url:"${path}/emp",
			type:"POST",
			data:$("#empAddModal form").serialize(),
			success:function(res){
				if(res.code == 100){
					$("#empAddModal").modal("hide");
				}else{
					if(undefined != res.extend.errorFields.email){
						show_validate_msg("#add_emp_email","error",res.extend.errorFields.email);
					}
					if(undefined != res.extend.errorFields.empName){
						show_validate_msg("#add_emp_name","error",res.extend.errorFields.empName);
					}
				}
			}, 
			error:function(msg){
				
			}
		});
	});

	//校验
	function validate_add_form(){
		var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;  //允许1.“a-z”  2.“A-Z”  3.“0-9”  4.“_”（下划线） 5.“-” 6. 6到16位字符  7.允许中文
		var empName = $("#add_emp_name").val();
		if(!regName.test(empName)){
			show_validate_msg("#add_emp_name","error","员工名称为2-5位中文或6-16为英文和数字的组合");
			return false;
		}else{
			show_validate_msg("#add_emp_name","success","员工名称合法");
		}
		var regEmail=/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
		var email = $("#add_emp_email").val();
		if(!regEmail.test(email)){
			show_validate_msg("#add_emp_email","error","邮箱格式不正确");
			return false;
		}else{
			show_validate_msg("#add_emp_email","success","邮箱合法");
		}
		return true;
	}
	//校验提示
	function show_validate_msg(ele,status,msg){
		$(ele).parent().removeClass("has-success has-error");
		$(ele).next("span").text("");
		if("success" == status){
			$(ele).parent().addClass("has-success");
		}else if("error" == status){
			$(ele).parent().addClass("has-error");
		}
		$(ele).next("span").text(msg);
	}
	//检验名称是否存在
	$("#add_emp_name").change(function(){
		var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;  //允许1.“a-z”  2.“A-Z”  3.“0-9”  4.“_”（下划线） 5.“-” 6. 6到16位字符  7.允许中文
		var empName = $("#add_emp_name").val();
		if(!regName.test(empName)){
			show_validate_msg("#add_emp_name","error","员工名称为2-5位中文或6-16为英文和数字的组合");
			return;
		}
		var empName = this.value;
		$.ajax({
			url:"${path}/checkUser",
			type:"POST",
			data:"empName="+empName,
			success:function(res){
				if(res.code == 100){
					show_validate_msg("#add_emp_name","success","员工名称合法");
					$("#emp_add_save").attr("ajax-value","success");
				}else{
					show_validate_msg("#add_emp_name","error","用户名已存在");
					$("#emp_add_save").attr("ajax-value","error");
				}
			}, 
			error:function(msg){
				
			}
		});
	})
	//编辑按钮绑定
	$(document).on("click",".edit_btn",function(){
		getDept("#update_dept_depts");
		var id = $(this).attr("edit_id");
		getEmp(id);
		$("#emp_update_save").attr("edit_id",id);
		$("#empUpdateModal").modal({
			backdrop:"static"
		});
	});
	//查询员工信息
	function getEmp(id){
		$.ajax({
			url:"${path}/emp/"+id,
			type:"get",
			success:function(res){
				var emp = res.extend.emp;
				$("#add_update_name").val(emp.empName);
				$("#add_update_email").val(emp.email);
				$("#empUpdateModal input[name=gendef]").val([emp.gendef]);
				$("#update_dept_depts").val([emp.dId]);
			}, 
			error:function(msg){
				
			}
		});
	}
	//更新按钮绑定
	$("#emp_update_save").click(function(){
		var regEmail=/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
		var email = $("#add_update_email").val();
		if(!regEmail.test(email)){
			show_validate_msg("#add_update_email","error","邮箱格式不正确");
			return false;
		}else{
			show_validate_msg("#add_update_email","success","邮箱合法");
		}
		$.ajax({
			url:"${path}/emp/"+$(this).attr("edit_id"),
			type:"PUT",
			data:$("#empUpdateModal form").serialize(),
			success:function(res){
				if(res.code == 100){
					$("#empAddModal").modal("hide");
				}else{
					
				}
			}, 
			error:function(msg){
				
			}
		});
	});
	//单个删除按钮绑定
	$(document).on("click",".delete_btn",function(){
		var empId = $(this).parents("tr").find("td:eq(1)").text();
		var empName = $(this).parents("tr").find("td:eq(2)").text();
		if(confirm("确认删除【" + empName + "】吗？")){
			$.ajax({
				url:"${path}/emp/"+empId,
				type:"DELETE",
				success:function(res){
					if(res.code == 100){
						alert("删除成功");
					}else{
						alert("删除失败");
					}
					//刷新页面
					window.location.reload();
				}, 
				error:function(msg){
					
				}
			});
		}
	});
	//全选与全不选
	$("#emp_check_all").click(function(){
		$(".emp_check_item").prop("checked",$(this).prop("checked"));
	});
	//多选框绑定
	$(document).on("click",".emp_check_item",function(){
		//判断选中数量是否是全选
		var flag = $(".emp_check_item:checked").length == $(".emp_check_item").length;
		$("#emp_check_all").prop("checked",flag);
	});
	$("#delete_emps").click(function(){
		var empNames = "";
		var empIds = "";
		$.each($(".emp_check_item:checked"),function(){
			empIds += $(this).parents("tr").find("td:eq(1)").text() + "-";
			empNames += $(this).parents("tr").find("td:eq(2)").text() + ",";
		});
		empIds = empIds.substring(0,empIds.length - 1);
		empNames = empNames.substring(0,empNames.length - 1);
		if(confirm("确认删除【" + empNames + "】吗？")){
			$.ajax({
				url:"${path}/emp/"+empIds,
				type:"DELETE",
				success:function(res){
					if(res.code == 100){
						alert("删除成功");
					}else{
						alert("删除失败");
					}
					//刷新页面
					window.location.reload();
				}, 
				error:function(msg){
					
				}
			});
		}
	});
</script>
</body>
</html>