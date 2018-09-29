<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>逆变器日总量管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/indaytotal/powerInverterDayTotal/">逆变器日总量列表</a></li>
		<shiro:hasPermission name="indaytotal:powerInverterDayTotal:edit"><li><a href="${ctx}/indaytotal/powerInverterDayTotal/form">逆变器日总量添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="powerInverterDayTotal" action="${ctx}/indaytotal/powerInverterDayTotal/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>逆变器编号：</label>
				<form:input path="inverterNumber" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>时间：</label>
				<input name="beginPowerDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${powerInverterDayTotal.beginPowerDate}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/> - 
				<input name="endPowerDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${powerInverterDayTotal.endPowerDate}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>逆变器编号</th>
				<th>发电量</th>
				<th>时间</th>
				<shiro:hasPermission name="indaytotal:powerInverterDayTotal:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="powerInverterDayTotal">
			<tr>
				<td><a href="${ctx}/indaytotal/powerInverterDayTotal/form?id=${powerInverterDayTotal.id}">
					${powerInverterDayTotal.inverterNumber}
				</a></td>
				<td>
					${powerInverterDayTotal.powerAmount}
				</td>
				<td>
					<fmt:formatDate value="${powerInverterDayTotal.powerDate}" pattern="yyyy-MM-dd"/>
				</td>
				<shiro:hasPermission name="indaytotal:powerInverterDayTotal:edit"><td>
    				<a href="${ctx}/indaytotal/powerInverterDayTotal/form?id=${powerInverterDayTotal.id}">修改</a>
					<a href="${ctx}/indaytotal/powerInverterDayTotal/delete?id=${powerInverterDayTotal.id}" onclick="return confirmx('确认要删除该逆变器日总量吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>