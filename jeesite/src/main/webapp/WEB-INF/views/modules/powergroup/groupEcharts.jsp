<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>组串电压电流监测</title>
<meta name="decorator" content="default" />
<script src="${ctxStatic}/echarts/echarts.min.js" type="text/javascript"></script>
<style type="text/css">
.menter-inverter {
	box-shadow: 1px 1px 6px 2px #b4adad;
	border-radius: 5px 5px 5px 5px;
	/* border: 1px solid #b4adad; */
	width: 95%;
	margin-left: 30px;
}
.search-div{
    margin-top: 10px;
    padding-left: 47px;
    margin-bottom: 10px;
}
.search-button{
margin-left: 10px;
}
.time-input{
	margin-top: 12px;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {

	});
</script>

</head>
<body>
	<%
		java.text.SimpleDateFormat df = new java.text.SimpleDateFormat(
				"yyyy-MM-dd HH:mm:ss");
		java.util.Date currentTime = new java.util.Date();//得到当前系统时间
		java.util.Date date = df.parse(df.format(new java.util.Date()));
		java.util.Calendar calendar = java.util.Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(java.util.Calendar.MONTH, -1);
		java.util.Date mdate = calendar.getTime();
	%>
	<br>
	
	<div class="menter-inverter">
		<span class="label label-important">组串电压电流数据图</span> <br>
		<div class="search-div">
		<label>逆变器：</label> 
		<select id="inverter">
		<c:forEach items="${inverters}" var="inverter">
  			<option>${inverter}</option>
  		</c:forEach>
		</select>
			<label style="margin-left: 10px;">时间：</label> 
			<input id="startTime" name="beginPowerDate"
				type="text" readonly="readonly" maxlength="20"
				class="input-medium Wdate time-input"
				value="<fmt:formatDate value="<%=mdate%>" pattern="yyyy-MM-dd HH:mm:ss"/>"
				onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});" />
			- <input id="endTime" name="endPowerDate" type="text"
				readonly="readonly" maxlength="20" class="input-medium Wdate time-input"
				value="<fmt:formatDate value="<%=date%>" pattern="yyyy-MM-dd HH:mm:ss"/>"
				onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});" />
			<input id="powerGroupButton" class="btn btn-primary search-button" type="button" value="查询" />
		</div>
		<div id="powerGroup" style="width: 100%; height: 400px;"></div>
	</div>
<br>


	<script type="text/javascript">
		// 指定图表的配置项和数据
		
		option = {
			title : {
				text : ''
			},
			tooltip : {
				trigger : 'axis'
			},
			legend : {
				data : [ '组串1电压', '组串1电流','组串2电压', '组串2电流','组串3电压', '组串3电流','组串4电压', '组串4电流','组串5电压', '组串5电流','组串6电压', '组串6电流','组串7电压', '组串7电流','组串8电压', '组串8电流' ]
			},
			grid : {
				left : '3%',
				right : '4%',
				bottom : '3%',
				containLabel : true
			},
			toolbox : {
				feature : {
					saveAsImage : {}
				}
			},
			dataZoom: [
		               {
		            	   id: 'dataZoomX',
		                   type: 'slider',
		                   xAxisIndex: [0],
		                   filterMode: 'filter', // 设定为 'filter' 从而 X 的窗口变化会影响 Y 的范围。
		                   start: 0,
		                   end: 100
		               }
		           ],
			xAxis : {
				type : 'category',
				boundaryGap : false,
				data : [ '周一', '周二', '周三', '周四', '周五', '周六', '周日' ]
			},
			yAxis : [
			         {
			    name :'电压V',    	 
				type : 'value'
			},{
				name : '电流A',
				type : 'value'
			}
			],
			series : [ {
				name : '电压1',
				type : 'line',
				data : [ 120, 132, 101, 134, 90, 230, 210 ]
			}, 
			{
				name : '电压2',
				type : 'line',
				data : [ 140, 143, 121, 164, 70, 280, 110 ]
			}, {
				name : '电流1',
				type : 'line',
			
				yAxisIndex: 1,
				data : [ 1, 2, 4, 6, 8, 4, 2 ]
			}, {
				name : '电流2',
				type : 'line',
				yAxisIndex: 1,
				data : [ 3, 4, 5, 2, 1, 7, 9 ]
			} ]
		};
		
		
		function myEcharts(startTime,endTime,inverter){
			 $.ajax({
					type : "POST",
					url : "${ctx}/powergroup/powerGroup/getChart",
					data : JSON.stringify({
						"beginGroupDate" : startTime,
						"endGroupDate" : endTime,
						"inverterNumber": inverter,
					}),
					async : false,
					contentType : "application/json;charset=utf-8",
					error : function() {
						alert("加载失败");
					},
					success : function(data) {
						//alert(typeof data)
						console.log('data', data);
						//miOption.legend.data = [];
						option.xAxis.data = [];
						option.series = [];
						option.xAxis.data = data.timeList;
					
						var g1y = {
							name : '组串1电压',
							type : 'line',
							data : data.g1y
						};
						option.series.push(g1y);
						var g1l = {
							name : '组串1电流',
							type : 'line',
							yAxisIndex: 1,
							data : data.g1l
						};
						option.series.push(g1l);
						
						var g2y = {
							name : '组串2电压',
							type : 'line',
							data : data.g2y
						};
						option.series.push(g2y);
						var g2l = {
							name : '组串2电流',
							type : 'line',
							yAxisIndex: 1,
							data : data.g2l
						};
						option.series.push(g2l);
						
						var g3y = {
							name : '组串3电压',
							type : 'line',
							data : data.g3y
						};
						option.series.push(g3y);
						var g3l = {
							name : '组串3电流',
							type : 'line',
							yAxisIndex: 1,
							data : data.g3l
						};
						option.series.push(g3l);
						
						var g4y = {
							name : '组串4电压',
							type : 'line',
							data : data.g4y
						};
						option.series.push(g4y);
						var g4l = {
							name : '组串4电流',
							type : 'line',
							yAxisIndex: 1,
							data : data.g4l
						};
						option.series.push(g4l);
						
						var g5y = {
							name : '组串5电压',
							type : 'line',
							data : data.g5y
						};
						option.series.push(g5y);
						var g5l = {
							name : '组串5电流',
							type : 'line',
							yAxisIndex: 1,
							data : data.g5l
						};
						option.series.push(g5l);
						
						var g6y = {
							name : '组串6电压',
							type : 'line',
							data : data.g6y
						};
						option.series.push(g6y);
						var g6l = {
							name : '组串6电流',
							type : 'line',
							yAxisIndex: 1,
							data : data.g6l
						};
						option.series.push(g6l);
						
						var g7y = {
							name : '组串7电压',
							type : 'line',
							data : data.g7y
						};
						option.series.push(g7y);
						var g7l = {
							name : '组串7电流',
							type : 'line',
							yAxisIndex: 1,
							data : data.g7l
						};
						option.series.push(g7l);
						
						var g8y = {
							name : '组串8电压',
							type : 'line',
							data : data.g8y
						};
						option.series.push(g8y);
						var g8l = {
							name : '组串8电流',
							type : 'line',
							yAxisIndex: 1,
							data : data.g8l
						};
						option.series.push(g8l);
						
						var chart = echarts.init(document.getElementById('powerGroup'));
						// 使用刚指定的配置项和数据显示图表。
						chart.setOption(option);
					}
				});
		}
		var stTime = new Date($("#startTime").val());
		var edTime = new Date($("#endTime").val());
		var inv = "1#NB01";
		myEcharts(stTime,edTime,inv); 
		$(function(){
			$("#powerGroupButton").click(function(){
				var startTime1 = new Date($("#startTime").val());
				var endTime1 = new Date($("#endTime").val());
				var inv1 = $("#inverter").val();
				myEcharts(startTime1,endTime1,inv1);
			});
		});
	</script>

</body>
</html>