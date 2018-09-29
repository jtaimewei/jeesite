<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>组串数据管理</title>
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
		<li class="active"><a href="${ctx}/ingroup/powerInverterGroup/">组串数据列表</a></li>
		<shiro:hasPermission name="ingroup:powerInverterGroup:edit"><li><a href="${ctx}/ingroup/powerInverterGroup/form">组串数据添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="powerInverterGroup" action="${ctx}/ingroup/powerInverterGroup/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>逆变器编号：</label>
				<form:input path="inverterNumber" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>组串编号：</label>
				<form:input path="groupString" htmlEscape="false" maxlength="10" class="input-medium"/>
			</li>
			<li><label>组串类型：</label>
				<form:input path="groupStringType" htmlEscape="false" maxlength="1" class="input-medium"/>
			</li>
			<li><label>时间：</label>
				<input name="beginPowerDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${powerInverterGroup.beginPowerDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/> - 
				<input name="endPowerDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${powerInverterGroup.endPowerDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
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
				<th>逆变器编号</th>
				<th>组串编号</th>
				<th>数据</th>
				<th>组串类型</th>
				<th>时间</th>
				<shiro:hasPermission name="ingroup:powerInverterGroup:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="powerInverterGroup">
			<tr>
				<td><a href="${ctx}/ingroup/powerInverterGroup/form?id=${powerInverterGroup.id}">
					${powerInverterGroup.inverterNumber}
				</a></td>
				<td>
					${powerInverterGroup.groupString}
				</td>
				<td>
					${powerInverterGroup.groupData}
				</td>
				<td>
					${powerInverterGroup.groupStringType}
				</td>
				<td>
					<fmt:formatDate value="${powerInverterGroup.powerDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<shiro:hasPermission name="ingroup:powerInverterGroup:edit"><td>
    				<a href="${ctx}/ingroup/powerInverterGroup/form?id=${powerInverterGroup.id}">修改</a>
					<a href="${ctx}/ingroup/powerInverterGroup/delete?id=${powerInverterGroup.id}" onclick="return confirmx('确认要删除该组串数据吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>