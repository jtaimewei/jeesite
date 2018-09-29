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

.search-div {
	margin-top: 10px;
	padding-left: 47px;
	margin-bottom: 10px;
}

.search-button {
	margin-left: 10px;
}

.time-input {
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
	<!-- 电表-逆变器 -->
	<div class="menter-inverter">
		<span class="label label-important">电表-逆变器发电量数据图</span> <br>
		<div class="search-div">
			<label>时间：</label> <input id="startTime1" name="beginPowerDate"
				type="text" readonly="readonly" maxlength="20"
				class="input-medium Wdate time-input"
				value="<fmt:formatDate value="<%=mdate%>" pattern="yyyy-MM-dd"/>"
				onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});" />
			- <input id="endTime1" name="endPowerDate" type="text"
				readonly="readonly" maxlength="20"
				class="input-medium Wdate time-input"
				value="<fmt:formatDate value="<%=date%>" pattern="yyyy-MM-dd"/>"
				onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});" />
			<input id="meterInverterButton" class="btn btn-primary search-button"
				type="button" value="查询" />
		</div>
		<div id="meterInverter" style="width: 100%; height: 400px;"></div>
	</div>
	<br>
	<script type="text/javascript">
		// 指定图表的配置项和数据
		miOption = {
			title : {
				text : '电表-逆变器发电量'
			},
			tooltip : {
				trigger : 'axis'
			},
			legend : {
				data : [ '电表发电量', '逆变器发电量', '辐照度', '组串数量' ]
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
				type : 'value'
			},
			yAxis : [ {
				name : '电气量',
				type : 'value'
			}, {
				name : '硬件数据',
				type : 'value'
			} ],
			series : [ {
				name : '电表发电量',
				type : 'line',
				stack : '总量',
				data : [ 120, 132, 101, 134, 90, 230, 210 ]
			}, {
				name : '逆变器发电量',
				type : 'line',
				stack : '总量',
				data : [ 220, 182, 191, 234, 290, 330, 310 ]
			} ]
		};

		var startTime1 = $("#startTime1").val();
		var endTime1 = $("#endTime1").val();

		$.ajax({
			type : "POST",
			url : "${ctx}/powergen/powerGeneration/getChart",
			data : JSON.stringify({
				"beginPowerDate" : startTime1,
				"endPowerDate" : endTime1
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
				miOption.xAxis.data = [];
				miOption.series = [];
				miOption.xAxis.data = data.timeList;

				var meter = {
					name : '电表发电量',
					type : 'line',
					//stack: '总量',
					data : data.meterList
				};
				miOption.series.push(meter);

				var inverter = {
					name : '逆变器发电量',
					type : 'line',
					//stack: '总量',
					data : data.inverterList
				};
				miOption.series.push(inverter);
				var irradiation = {
					name : '辐照度',
					type : 'line',
					//stack: '总量',
					data : data.irradiationList
				};
				miOption.series.push(irradiation);
				var groups = {
					name : '组串数量',
					type : 'line',
					yAxisIndex : 1,
					//stack: '总量',
					data : data.groups
				};
				miOption.series.push(groups);
				var miChart = echarts.init(document
						.getElementById('meterInverter'));
				// 使用刚指定的配置项和数据显示图表。
				miChart.setOption(miOption);
			}
		});
		$(function() {
			$("#meterInverterButton").click(
					function() {
						var startTime1 = $("#startTime1").val();
						var endTime1 = $("#endTime1").val();
						$.ajax({
							type : "POST",
							url : "${ctx}/powergen/powerGeneration/getChart",
							data : JSON.stringify({
								"beginPowerDate" : startTime1,
								"endPowerDate" : endTime1
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
								miOption.xAxis.data = [];
								miOption.series = [];
								miOption.xAxis.data = data.timeList;

								var meter = {
									name : '电表发电量',
									type : 'line',
									//stack: '总量',
									data : data.meterList
								};
								miOption.series.push(meter);

								var inverter = {
									name : '逆变器发电量',
									type : 'line',
									//stack: '总量',
									data : data.inverterList
								};
								miOption.series.push(inverter);
								var irradiation = {
									name : '辐照度',
									type : 'line',
									//stack: '总量',
									data : data.irradiationList
								};
								miOption.series.push(irradiation);
								var groups = {
									name : '组串数量',
									type : 'line',
									//stack: '总量',
									data : data.groups
								};
								miOption.series.push(groups);
								var miChart = echarts.init(document
										.getElementById('meterInverter'));
								// 使用刚指定的配置项和数据显示图表。
								miChart.setOption(miOption);
							}
						});
					});
		});
	</script>

</body>
</html>