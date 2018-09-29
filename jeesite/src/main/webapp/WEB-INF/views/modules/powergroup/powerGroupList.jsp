<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>组串电压电流管理</title>
	<meta name="decorator" content="default"/>
	<style type="text/css">
	table td{word-break: keep-all;white-space:nowrap;}
	</style>
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
		<li class="active"><a href="${ctx}/powergroup/powerGroup/">组串电压电流列表</a></li>
		<shiro:hasPermission name="powergroup:powerGroup:edit"><li><a href="${ctx}/powergroup/powerGroup/form">组串电压电流添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="powerGroup" action="${ctx}/powergroup/powerGroup/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>逆变器编号：</label>
				<form:input path="inverterNumber" htmlEscape="false" maxlength="64" class="input-medium"/>
			</li>
			<li><label>日期：</label>
				<input name="beginGroupDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${powerGroup.beginGroupDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/> - 
				<input name="endGroupDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${powerGroup.endGroupDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
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
				<th>组串1电压</th>
				<th>组串1电流</th>
				<th>组串2电压</th>
				<th>组串2电流</th>
				<th>组串3电压</th>
				<th>组串3电流</th>
				<th>组串4电压</th>
				<th>组串4电流</th>
				<th>组串5电压</th>
				<th>组串5电流</th>
				<th>组串6电压</th>
				<th>组串6电流</th>
				<th>组串7电压</th>
				<th>组串7电流</th>
				<th>组串8电压</th>
				<th>组串8电流</th>
				<th>日期</th>
				<shiro:hasPermission name="powergroup:powerGroup:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="powerGroup">
			<tr>
				<td><a href="${ctx}/powergroup/powerGroup/form?id=${powerGroup.id}">
					${powerGroup.inverterNumber}
				</a></td>
				<td>
					${powerGroup.groupOneDy}
				</td>
				<td>
					${powerGroup.groupOneDl}
				</td>
				<td>
					${powerGroup.groupTwody}
				</td>
				<td>
					${powerGroup.groupTwoDl}
				</td>
				<td>
					${powerGroup.groupThreeDy}
				</td>
				<td>
					${powerGroup.groupThreeDl}
				</td>
				<td>
					${powerGroup.groupFourDy}
				</td>
				<td>
					${powerGroup.groupFourDl}
				</td>
				<td>
					${powerGroup.groupFiveDy}
				</td>
				<td>
					${powerGroup.groupFiveDl}
				</td>
				<td>
					${powerGroup.groupSixDy}
				</td>
				<td>
					${powerGroup.groupSixDl}
				</td>
				<td>
					${powerGroup.groupSevenDy}
				</td>
				<td>
					${powerGroup.groupSevenDl}
				</td>
				<td>
					${powerGroup.groupEightDy}
				</td>
				<td>
					${powerGroup.groupEightDl}
				</td>
				<td>
					<fmt:formatDate value="${powerGroup.groupDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<shiro:hasPermission name="powergroup:powerGroup:edit"><td>
    				<a href="${ctx}/powergroup/powerGroup/form?id=${powerGroup.id}">修改</a>
					<a href="${ctx}/powergroup/powerGroup/delete?id=${powerGroup.id}" onclick="return confirmx('确认要删除该组串电压电流吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>