<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>组串数据管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/ingroup/powerInverterGroup/">组串数据列表</a></li>
		<li class="active"><a href="${ctx}/ingroup/powerInverterGroup/form?id=${powerInverterGroup.id}">组串数据<shiro:hasPermission name="ingroup:powerInverterGroup:edit">${not empty powerInverterGroup.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="ingroup:powerInverterGroup:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="powerInverterGroup" action="${ctx}/ingroup/powerInverterGroup/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">逆变器编号：</label>
			<div class="controls">
				<form:input path="inverterNumber" htmlEscape="false" maxlength="64" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">组串编号：</label>
			<div class="controls">
				<form:input path="groupString" htmlEscape="false" maxlength="10" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">数据：</label>
			<div class="controls">
				<form:input path="groupData" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">组串类型：</label>
			<div class="controls">
				<form:input path="groupStringType" htmlEscape="false" maxlength="1" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">时间：</label>
			<div class="controls">
				<input name="powerDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${powerInverterGroup.powerDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="ingroup:powerInverterGroup:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>