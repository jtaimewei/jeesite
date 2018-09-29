<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>逆变器月平均发电量管理</title>
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
		<li><a href="${ctx}/inmonthavr/powerInverterMonthAverage/">逆变器月平均发电量列表</a></li>
		<li class="active"><a href="${ctx}/inmonthavr/powerInverterMonthAverage/form?id=${powerInverterMonthAverage.id}">逆变器月平均发电量<shiro:hasPermission name="inmonthavr:powerInverterMonthAverage:edit">${not empty powerInverterMonthAverage.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="inmonthavr:powerInverterMonthAverage:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="powerInverterMonthAverage" action="${ctx}/inmonthavr/powerInverterMonthAverage/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">逆变器编号：</label>
			<div class="controls">
				<form:input path="inverterNumber" htmlEscape="false" maxlength="64" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">月平均发电量：</label>
			<div class="controls">
				<form:input path="monthAveragePower" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">减平均值：</label>
			<div class="controls">
				<form:input path="deAverage" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">组串数量：</label>
			<div class="controls">
				<form:input path="groupStringNumber" htmlEscape="false" maxlength="64" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">串均发电量：</label>
			<div class="controls">
				<form:input path="stringAveragePower" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">时间：</label>
			<div class="controls">
				<input name="powerDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${powerInverterMonthAverage.powerDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="inmonthavr:powerInverterMonthAverage:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>