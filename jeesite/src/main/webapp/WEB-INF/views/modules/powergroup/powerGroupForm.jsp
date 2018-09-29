<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>组串电压电流管理</title>
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
		<li><a href="${ctx}/powergroup/powerGroup/">组串电压电流列表</a></li>
		<li class="active"><a href="${ctx}/powergroup/powerGroup/form?id=${powerGroup.id}">组串电压电流<shiro:hasPermission name="powergroup:powerGroup:edit">${not empty powerGroup.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="powergroup:powerGroup:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="powerGroup" action="${ctx}/powergroup/powerGroup/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">逆变器编号：</label>
			<div class="controls">
				<form:input path="inverterNumber" htmlEscape="false" maxlength="64" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">组串1电压：</label>
			<div class="controls">
				<form:input path="groupOneDy" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">组串1电流：</label>
			<div class="controls">
				<form:input path="groupOneDl" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">组串2电压：</label>
			<div class="controls">
				<form:input path="groupTwody" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">组串2电流：</label>
			<div class="controls">
				<form:input path="groupTwoDl" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">组串3电压：</label>
			<div class="controls">
				<form:input path="groupThreeDy" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">组串3电流：</label>
			<div class="controls">
				<form:input path="groupThreeDl" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">组串4电压：</label>
			<div class="controls">
				<form:input path="groupFourDy" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">组串4电流：</label>
			<div class="controls">
				<form:input path="groupFourDl" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">组串5电压：</label>
			<div class="controls">
				<form:input path="groupFiveDy" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">组串5电流：</label>
			<div class="controls">
				<form:input path="groupFiveDl" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">组串6电压：</label>
			<div class="controls">
				<form:input path="groupSixDy" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">组串6电流：</label>
			<div class="controls">
				<form:input path="groupSixDl" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">组串7电压：</label>
			<div class="controls">
				<form:input path="groupSevenDy" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">组串7电流：</label>
			<div class="controls">
				<form:input path="groupSevenDl" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">组串8电压：</label>
			<div class="controls">
				<form:input path="groupEightDy" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">组串8电流：</label>
			<div class="controls">
				<form:input path="groupEightDl" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">日期：</label>
			<div class="controls">
				<input name="groupDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${powerGroup.groupDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="powergroup:powerGroup:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>