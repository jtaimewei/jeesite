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
	<!-- 电表-逆变器 -->
	<div class="menter-inverter">
		<span class="label label-important">预测图谱</span> 
		<br>
		<br>
		<div id="main" style="width: 100%; height: 400px;"></div>
	</div>
<br>
	<script type="text/javascript">
		// 指定图表的配置项和数据
		option = {
			title : {
				text : '预测图谱'
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
				data : [ '温度1-风速1-风向1-压力1-辐照1', 
				         '温度2-风速2-风向2-压力2-辐照2', 
				         '温度3-风速3-风向3-压力3-辐照3', 
				         '温度4-风速4-风向4-压力4-辐照4', 
				         '温度5-风速5-风向5-压力5-辐照5', 
				         '温度6-风速6-风向6-压力6-辐照6', 
				         '温度7-风速7-风向7-压力7-辐照7',
				         '温度8-风速8-风向8-压力8-辐照8', 
				         '温度9-风速9-风向9-压力9-辐照9', 
				         '温度10-风速10-风向10-压力10-辐照10', 
				         '温度11-风速11-风向11-压力11-辐照11', 
				         '温度12-风速12-风向12-压力12-辐照12', 
				         '温度13-风速13-风向13-压力13-辐照13', 
				         '温度14-风速14-风向14-压力14-辐照14']
			},
			yAxis : {
				type : 'value'
			},
			series : [ {
				name : '电表发电量',
				type : 'line',
			
				data : [ 120, 132, 101, 134, 90, 230, 210,120, 132, 101, 134, 90, 230, 210 ]
			}, {
				name : '逆变器发电量',
				type : 'line',
			
				data : [ 220, 182, 191, 234, 290, 330, 310, 220, 182, 191, 234, 290, 330, 310]
			}, {
				name : '辐照度发电量',
				type : 'line',
				data:[150, 232, 201, 154, 190, 330, 410,150, 232, 201, 154, 190, 330, 410]
			} ]
		};
		
		var chart = echarts.init(document.getElementById('main'));
		// 使用刚指定的配置项和数据显示图表。
		chart.setOption(option);
		
	</script>
	
</body>
</html>