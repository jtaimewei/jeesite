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
	
	<br>
	
	<div class="menter-inverter">
		<span class="label label-important">未来预测数据</span> <br>
		
		<div id="main" style="width: 100%; height: 400px;"></div>
	</div>
<br>
	<script type="text/javascript">
		// 指定图表的配置项和数据
		option = {
			title : {
				text : '未来预测数据'
			},
			tooltip : {
				trigger : 'axis'
			},
			legend : {
				data : [ '电表发电量', '逆变器发电量','辐照度发电量' ]
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
				data : [ '2018-5-26',
				         '2018-5-27',
				         '2018-5-28',
				         '2018-5-29',
				         '2018-5-30',
				         '2018-5-31', 
				         '2018-6-1' ]
			},
			yAxis : {
				type : 'value'
			},
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
			}, {
				name : '辐照度发电量',
				type : 'line',
				data:  [320, 232, 101, 434, 590, 330, 320]
			} ]
		};
	
		var chart = echarts.init(document.getElementById('main'));
		// 使用刚指定的配置项和数据显示图表。
		chart.setOption(option);
		
	</script>
	
</body>
</html>