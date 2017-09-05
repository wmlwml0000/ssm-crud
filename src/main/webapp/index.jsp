<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
<%
	pageContext.setAttribute("path", request.getContextPath());
%>
<!-- jquery引入在bootstrap之前，否则会发生错误 -->
<script type="text/javascript"
	src="${path }/static/js/jquery-1.12.4.min.js"></script>
<link rel="stylesheet"
	href="${path}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css">
<script type="text/javascript"
	src="${path }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

</head>
<body>

	<!-- 员工添加的模态框 -->
	<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">员工添加</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="emp_form">
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">EmpName</label>
							<div class="col-sm-10">
								<input type="text" name="empName" class="form-control"
									id="empName_input" placeholder="张三" /> <span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">Gender</label>
							<div class="col-sm-10">
								<label class="radio-inline"> <input type="radio"
									name="gender" id="gender_m" value="M" checked> 男
								</label> <label class="radio-inline"> <input type="radio"
									name="gender" id="gender_f" value="F"> 女
								</label>
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">Email</label>
							<div class="col-sm-10">
								<input type="email" name="email" class="form-control"
									id="email_input" placeholder="gaolei@qq.com" />
								<!-- 示例 -->
								<span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">DeptName</label>
							<div class="col-sm-5">
								<select class="form-control" name="dId" id="deptName_input">
								</select>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" id="save_emp_btn">Save
						changes</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 员工修改的模态框 -->
	<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">员工修改</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="emp_update_form">
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">EmpName</label>
							<div class="col-sm-10">
								 <p class="form-control-static" id="empName_update_input"></p>
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">Gender</label>
							<div class="col-sm-10">
								<label class="radio-inline"> <input type="radio"
									name="gender" id="genderm_update_input" value="M" checked> 男
								</label> <label class="radio-inline"> <input type="radio"
									name="gender" id="genderf_update_input" value="F"> 女
								</label>
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">Email</label>
							<div class="col-sm-10">
								<input type="email" name="email" class="form-control"
									id="email_update_input" placeholder="gaolei@qq.com" />
								<!-- 示例 -->
								<span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">DeptName</label>
							<div class="col-sm-5">
								<select class="form-control" name="dId" id="deptName_update_input">
								</select>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" id="update_emp_btn">Update</button>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h1>SSM-CRUD</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-md-4 col-md-offset-8">
				<button class="btn btn-primary" id="emp_add_btn">增加</button>
				<button class="btn btn-danger" id="emp_del_btn">删除</button>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="emps_table">
					<thead>
						<tr>
							<th><input type="checkbox" id="check_all"/></th>
							<th>#</th>
							<th>Name</th>
							<th>Gender</th>
							<th>Email</th>
							<th>DeptName</th>
							<th>Operate</th>
						</tr>
					</thead>
					<tbody>

					</tbody>
				</table>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6" id="page_info_area"></div>
			<div class="col-md-6" id="page_nav_area"></div>
		</div>
	</div>
	<script type="text/javascript">
		var lastPageNum,currentPageNum;
		$(function() {
			//alert("hello");
			toPage(1);

		});
		//添加用户
		$("#emp_add_btn").click(function() {
			getDepts("#deptName_input");
			resetForm("#emp_form");
			$('#empAddModal').modal({
				backdrop : "static"
			});
		});
		function getDepts(ele) {
			$(ele).empty();
			$.ajax({
				url : "${path}/depts",
				data : "",
				type : "POST",
				success : function(result) {
					$.each(result.map.depts, function() {
						$("<option></option>").append(this.deptName).attr("value", this.deptId)
						.appendTo(ele);

					});
				}
			});
		}
		$("#empName_input").change(
				function() {
					var val = this.value;
					$.ajax({
						url : "${path}/checkUser",
						data : "empName=" + val,
						type : "POST",
						success : function(result) {
							if (result.code == 100) {
								showValidateMsg("#empName_input", "success",
										"用户名可以使用");
								$("#save_emp_btn").attr("save", "yes");
							} else if (result.code == 200) {
								showValidateMsg("#empName_input", "error",
										result.map.error);
								$("#save_emp_btn").attr("save", "no");
							}
						}
					})
				});
		//保存按钮事件
		$("#save_emp_btn").click(function() {
			if (!validateEmpForm())
				return false;
			if ($(this).attr("save") == "no")
				return false;
			$.ajax({
				url : "${path}/emps",
				data : $("#emp_form").serialize(),
				type : "POST",
				success : function(result) {
					//alert(result.msg);
					if (result.code == 100) {
						$('#empAddModal').modal("hide");
						//alert($("emp_form").serialize());
						toPage(lastPageNum + 1);
					} else {
						if (undefined != result.map.errorFields.empName) {
							showValidateMsg(
									"#empName_input",
									"error",
									result.map.errorFields.empName);
						}
						if (undefined != result.map.errorFields.email) {
							showValidateMsg(
									"#email_input",
									"error",
									result.map.errorFields.email);
						}
					}
				}
			});
		});
		//重置表单
		function resetForm(ele) {
			$(ele)[0].reset();
			$(ele).find("*").removeClass("has-error has-success");
			$(ele).find(".help-block").text("");
		}
		function validateEmpForm() {
			var flag = true;
			//1.
			var empName = $("#empName_input").val();
			var regName = /^[a-zA-Z0-9_-]{6,16}$|(^[\u2E80-\u9FFF]{2,5}$)/;
			if (!regName.test(empName)) {
				showValidateMsg("#empName_input", "error", "EmpName格式不正确");
				flag = false;
			} else {
				showValidateMsg("#empName_input", "success", "EmpName格式正确");
			}
			//2.
			var email = $("#email_input").val();
			var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			if (!regEmail.test(email)) {
				showValidateMsg("#email_input", "error", "Email格式不正确");
				flag = false;
			} else {
				showValidateMsg("#email_input", "success", "格式正确");
			}
			return flag;
		}
		function showValidateMsg(ele, status, msg) {
			$(ele).parent().removeClass("has-error has-success");
			$(ele).next("span").text("");
			if (status == "error") {
				$(ele).parent().addClass("has-error has-feedback");//.addClass("has-feedback")
				$(ele).next("span").text(msg);
			} else {
				$(ele).parent().addClass("has-success has-feedback");//.addClass("has-feedback")
				$(ele).next("span").text(msg);
			}
		}
		function toPage(pn) {
			$.ajax({
				url : "${path}/emps",
				data : "pn=" + pn,
				type : "GET",
				success : function(result) {
					build_emps_table(result);
					build_page_info(result);
					build_page_nav(result);
				}
			});
		}
		function build_emps_table(result) {
			$("#emps_table tbody").empty();

			var emps = result.map.pageInfo.list;
			$.each(emps, function(index, item) {
				var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
				//var checkBoxTd = $("<td></td>").append($("<input></input>").attr("type","checkbox"));
				var empIdTd = $("<td></td>").append(item.empId);
				var empNameTd = $("<td></td>").append(item.empName);
				var genderTd = $("<td></td>").append(item.gender == 'M' ? "男" : "女");
				var emailTd = $("<td></td>").append(item.email);
				var deptNameTd = $("<td></td>").append(item.department.deptName);
				var editbtn = $("<button></button>").addClass("btn btn-primary btn-sm editbtn")
				              .append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
				              .append("编辑").attr("editid",item.empId);
				
				var delbtn = $("<button></button>").addClass("btn btn-danger btn-sm delbtn")
				             .append($("<span></span>").addClass("glyphicon glyphicon-trash"))
						     .append("删除").attr("delid",item.empId);
				var operate = $("<td></td>").append(editbtn)
							 .append(" ")
						     .append(delbtn);
				$("<tr></tr>").append(checkBoxTd).append(empIdTd).append(empNameTd).append(genderTd)
							  .append(emailTd)
				              .append(deptNameTd).append(operate).appendTo($("#emps_table tbody"));
			});
		}
		//绑定编辑按钮
		$(document).on("click",".editbtn",function(){
			getDepts("#deptName_update_input");
			resetForm("#emp_update_form");
			getEmp($(this).attr("editid"));
			$("#update_emp_btn").attr("editid",$(this).attr("editid"));
			$('#empUpdateModal').modal({
				backdrop : "static"
			});
		});
		
		function getEmp(id){
			$.ajax({
				url:"${path}/emp/"+id,
				type:"GET",
				success:function(result){
					var emp=result.map.emp;
					$("#empName_update_input").text(emp.empName);
					$("#email_update_input").attr("value",emp.email);
					$("#emp_update_form input[name=gender]").val([emp.gender]);
					$("#emp_update_form select").val([emp.dId]);
				}
			})
		}
		//更新
		$("#update_emp_btn").click(function(){
			
			var email = $("#email_update_input").val();
			var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			if (!regEmail.test(email)) {
				showValidateMsg("#email_update_input", "error", "Email格式不正确");
				return false;
			} else {
				showValidateMsg("#email_update_input", "success", "格式正确");
			}
			
			$.ajax({
				url:"${path}/emp/"+$(this).attr("editid"),
				data:$("#emp_update_form").serialize(),//+"&_method=PUT",
				type:"PUT",
				success:function(result){
					$("#empUpdateModal").modal("hide");
					toPage(currentPageNum);
				}
			})
		});
		//绑定删除按钮
		$(document).on("click",".delbtn",function(){
			var empName=$(this).parents().find("tr td:eq(2)").text();
			var empId=$(this).parents().find("tr td:eq(1)").text();
			if(confirm("确认要删除"+empName+"吗？")){
				$.ajax({
					url:"${path}/emp/"+empId,
					type:"DELETE",
					success:function(result){
						alert("删除成功！");
						toPage(currentPageNum);
					}
				})
			}
		});
		//全选按钮
		$("#check_all").click(function(){
			//dom原生的属性，使用prop，自定义的用attr
			$(".check_item").prop("checked",$(this).prop("checked"));
		});
		//后来添加的需用以下方式添加事件
		$(document).on("click",".check_item",function(){
			var flag=$(".check_item:checked").length==$(".check_item").length;
			$("#check_all").prop("checked",flag);
		});
		//批量删除
		$("#emp_del_btn").click(function(){
			alert("确定要删除吗？");
			var ids="";
			$.each($(".check_item:checked"),function(){
				ids+=$(this).parents("tr").find("td:eq(1)").text()+"-";
			});
			ids=ids.substring(0,ids.length-1);
			$.ajax({
				url:"${path}/emp/"+ids,
				type:"DELETE",
				success:function(result){
					if(result.code==100)alert("删除成功！");
					toPage(currentPageNum);
				}
			});
		});
		
		//页码信息
		function build_page_info(result) {
			$("#page_info_area").empty();
			$("#page_info_area").append(
					"当前第" + result.map.pageInfo.pageNum + "页，总"
							+ result.map.pageInfo.pages + "页，总"
							+ result.map.pageInfo.total + "条记录");
			lastPageNum = result.map.pageInfo.pages;
			currentPageNum = result.map.pageInfo.pageNum;
		}
		
		//分页信息
		function build_page_nav(result) {
			$("#page_nav_area").empty();

			var ul = $("<ul></ul>").addClass("pagination");

			var firstPage = $("<li></li>").append($("<a></a>").append("首页"));
			var prePage = $("<li></li>").append($("<a></a>").append("&laquo;"));
			if (result.map.pageInfo.hasPreviousPage == false) {
				firstPage.addClass("disabled");
				prePage.addClass("disabled");
			} else {
				firstPage.click(function() {
					toPage(1);
				});
				prePage.click(function() {
					toPage(result.map.pageInfo.pageNum - 1);
				});
			}

			var nextPage = $("<li></li>")
					.append($("<a></a>").append("&raquo;"));
			var lastPage = $("<li></li>").append($("<a></a>").append("末页"));
			if (result.map.pageInfo.hasNextPage == false) {
				lastPage.addClass("disabled");
				nextPage.addClass("disabled");
			} else {
				lastPage.click(function() {
					toPage(result.map.pageInfo.pages);
				});
				nextPage.click(function() {
					toPage(result.map.pageInfo.pageNum + 1);
				});
			}

			ul.append(firstPage).append(prePage);
			var nums = result.map.pageInfo.navigatepageNums;
			$.each(nums, function(index, item) {
				var num = $("<li></li>").append($("<a></a>").append(item));
				if (result.map.pageInfo.pageNum == item)
					num.addClass("active");
				num.click(function() {
					toPage(item);
				});
				ul.append(num);
			});
			ul.append(nextPage).append(lastPage);
			$("<nav></nav>").append(ul).appendTo("#page_nav_area");
			//$("#page_nav_area").append($("<nav></nav>").append(ul));
		}
	</script>
</body>
</html>