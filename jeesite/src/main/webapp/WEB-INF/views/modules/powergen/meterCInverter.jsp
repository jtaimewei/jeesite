<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>发电量</title>
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
				"yyyy-MM-dd");
		java.util.Date currentTime = new java.util.Date();//得到当前系统时间
		java.util.Date date = df.parse(df.format(new java.util.Date()));
		java.util.Calendar calendar = java.util.Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(java.util.Calendar.MONTH, -1);
		java.util.Date mdate = calendar.getTime();
	%>
	
	<br>
<!-- 电表/逆变器 -->
	<div class="menter-inverter">
		<span class="label label-important">实际发电量/逆变器发电量 数据图</span> <br>
		<div class="search-div">
			<label>时间：</label> <input id="startTime3" name="beginPowerDate"
				type="text" readonly="readonly" maxlength="20"
				class="input-medium Wdate time-input"
				value="<fmt:formatDate value="<%=mdate%>" pattern="yyyy-MM-dd"/>"
				onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});" />
			- <input id="endTime3" name="endPowerDate" type="text"
				readonly="readonly" maxlength="20" class="input-medium Wdate time-input"
				value="<fmt:formatDate value="<%=date%>" pattern="yyyy-MM-dd"/>"
				onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});" />
			<input id="meter-InverterButton" class="btn btn-primary search-button" type="button" value="查询" />
		</div>
		<div id="meter-Inverter" style="width: 100%; height: 400px;"></div>
	</div>
	<br>

	<script type="text/javascript">
		// 指定图表的配置项和数据
		mitOption = {
			title : {
				text : ''
			},
			tooltip : {
				trigger : 'axis'
			},
			legend : {
				data : [ '实际发电量/逆变器发电量']
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
			xAxis : {
				type : 'category',
				boundaryGap : false,
				data : [ '周一', '周二', '周三', '周四', '周五', '周六', '周日' ]
			},
			yAxis : {
				type : 'value',
				axisLabel: {
		            formatter: '{value}.00 %'
		        },
		        min:90
			},
			series : [ {
				name : '实际发电量/逆变器发电量',
				type : 'line',
				data : [ 120, 132, 101, 134, 90, 230, 210 ],
				areaStyle: {},
	            smooth: true
			}]
		};
		
		var startTime3 = $("#startTime3").val();
		var endTime3 = $("#endTime3").val();

		 $.ajax({
			type : "POST",
			url : "${ctx}/powergen/powerGeneration/getMITChart",
			data : JSON.stringify({
				"beginPowerDate" : startTime3,
				"endPowerDate" : endTime3
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
				mitOption.xAxis.data = [];
				mitOption.series = [];
				mitOption.xAxis.data = data.timeList;
			
				var mit = {
					name : '实际发电量/逆变器发电量',
					type : 'line',
					areaStyle: {},
		            smooth: true,
					//stack: '总量',
					data : data.mitList
					
				};
				mitOption.series.push(mit);
				
				var mitChart = echarts.init(document.getElementById('meter-Inverter'));
				// 使用刚指定的配置项和数据显示图表。
				mitChart.setOption(mitOption);
			}
		}); 
		
		$(function(){
			$("#meter-InverterButton").click(function(){
				var startTime3 = $("#startTime3").val();
				var endTime3 = $("#endTime3").val();
				 $.ajax({
						type : "POST",
						url : "${ctx}/powergen/powerGeneration/getMITChart",
						data : JSON.stringify({
							"beginPowerDate" : startTime3,
							"endPowerDate" : endTime3
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
							mitOption.xAxis.data = [];
							mitOption.series = [];
							mitOption.xAxis.data = data.timeList;
						
							var mit = {
								name : '实际发电量/逆变器发电量',
								type : 'line',
								areaStyle: {},
					            smooth: true,
								//stack: '总量',
								data : data.mitList
								
							};
							mitOption.series.push(mit);
							
							var mitChart = echarts.init(document.getElementById('meter-Inverter'));
							// 使用刚指定的配置项和数据显示图表。
							mitChart.setOption(mitOption);
						}
					}); 
			});
		});
	</script>
	
	
</body>
</html>