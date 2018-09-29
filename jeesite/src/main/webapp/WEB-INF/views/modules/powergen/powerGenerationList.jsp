<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>电气发电量管理</title>
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
		<li class="active"><a href="${ctx}/powergen/powerGeneration/">电气发电量列表</a></li>
		<shiro:hasPermission name="powergen:powerGeneration:edit"><li><a href="${ctx}/powergen/powerGeneration/form">电气发电量添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="powerGeneration" action="${ctx}/powergen/powerGeneration/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>时间：</label>
				<input name="beginPowerDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${powerGeneration.beginPowerDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/> - 
				<input name="endPowerDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${powerGeneration.endPowerDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>电表发电量</th>
				<th>理论发电量</th>
				<th>逆变器发电量</th>
				<th>辐照度</th>
				<th>辐照电量</th>
				<th>组串数量</th>
				<th>时间</th>
				<shiro:hasPermission name="powergen:powerGeneration:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="powerGeneration">
			<tr>
				<td><a href="${ctx}/powergen/powerGeneration/form?id=${powerGeneration.id}">
					${powerGeneration.meterPower}
				</a></td>
				<td>
					${powerGeneration.theoreticalPower}
				</td>
				<td>
					${powerGeneration.inverterPower}
				</td>
				<td>
					${powerGeneration.irradiation}
				</td>
				<td>
					${powerGeneration.irradiationPower}
				</td>
				<td>
					${powerGeneration.groups}
				</td>
				<td>
					<fmt:formatDate value="${powerGeneration.powerDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<shiro:hasPermission name="powergen:powerGeneration:edit"><td>
    				<a href="${ctx}/powergen/powerGeneration/form?id=${powerGeneration.id}">修改</a>
					<a href="${ctx}/powergen/powerGeneration/delete?id=${powerGeneration.id}" onclick="return confirmx('确认要删除该电气发电量吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>