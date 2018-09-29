<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>${fns:getConfig('productName')} 登录</title>
	<meta name="decorator" content="blank"/>
	<style type="text/css">
      html,body,table{background-color:#f5f5f5;width:100%;text-align:center;}.form-signin-heading{font-family:Helvetica, Georgia, Arial, sans-serif, 黑体;font-size:36px;margin-bottom:20px;color:#0663a2;}
      .form-signin{position:relative;text-align:left;width:300px;padding:25px 29px 29px;margin:0 auto 20px;background-color:#fff;border:1px solid #e5e5e5;
        	-webkit-border-radius:5px;-moz-border-radius:5px;border-radius:5px;-webkit-box-shadow:0 1px 2px rgba(0,0,0,.05);-moz-box-shadow:0 1px 2px rgba(0,0,0,.05);box-shadow:0 1px 2px rgba(0,0,0,.05);}
      .form-signin .checkbox{margin-bottom:10px;color:#0663a2;} .form-signin .input-label{font-size:16px;line-height:23px;color:#999;}
      .form-signin .input-block-level{font-size:16px;height:auto;margin-bottom:15px;padding:7px;*width:283px;*padding-bottom:0;_padding:7px 7px 9px 7px;}
      .form-signin .btn.btn-large{font-size:16px;} .form-signin #themeSwitch{position:absolute;right:15px;bottom:10px;}
      .form-signin div.validateCode {padding-bottom:15px;} .mid{vertical-align:middle;}
      .header{height:80px;padding-top:20px;} .alert{position:relative;width:300px;margin:0 auto;*padding-bottom:0px;}
      label.error{background:none;width:270px;font-weight:normal;color:inherit;margin:0;}
    </style>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#loginForm").validate({
				rules: {
					validateCode: {remote: "${pageContext.request.contextPath}/servlet/validateCodeServlet"}
				},
				messages: {
					username: {required: "请填写用户名."},password: {required: "请填写密码."},
					validateCode: {remote: "验证码不正确.", required: "请填写验证码."}
				},
				errorLabelContainer: "#messageBox",
				errorPlacement: function(error, element) {
					error.appendTo($("#loginError").parent());
				} 
			});
		});
		// 如果在框架或在对话框中，则弹出提示并跳转到首页
		if(self.frameElement && self.frameElement.tagName == "IFRAME" || $('#left').length > 0 || $('.jbox').length > 0){
			alert('未登录或登录超时。请重新登录，谢谢！');
			top.location = "${ctx}";
		}
	</script>
</head>


<body>
	<!--[if lte IE 6]><br/><div class='alert alert-block' style="text-align:left;padding-bottom:10px;"><a class="close" data-dismiss="alert">x</a><h4>温馨提示：</h4><p>你使用的浏览器版本过低。为了获得更好的浏览体验，我们强烈建议您 <a href="http://browsehappy.com" target="_blank">升级</a> 到最新版本的IE浏览器，或者使用较新版本的 Chrome、Firefox、Safari 等。</p></div><![endif]-->
	<div id="particles-js">
		<canvas class="particles-js-canvas-el" width="1349" height="577" style="width: 100%; height: 100%;">
			
		</canvas>
	</div>
	
	<script type="text/javascript" async="" src="${ctxStatic}/LUIS ZUNO_files/analytics.js"></script>
	<script src="${ctxStatic}/LUIS ZUNO_files/particles.js"></script>
 	<script src="${ctxStatic}/LUIS ZUNO_files/app.js"></script>
	
	
	<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-12324069-1');
</script>
<style>
	

@font-face {
font-family: '04b_03';
src: url('04B_03__.TTF');
src:  
     url('04B_03__.TTF') format('truetype');
} 


strong{
	color: #FE279E;	
}


* 
{
	font-size: 1.0em;
	margin: 0;
	padding: 0;
	outline: none;
}

/* TEXT */

body
{
	font-family: "04b_03", Helvetica, Arial, sans-serif;
	font-size: 16px; /* was 10px */
	color: #38D5E7;
	background-color: #2E2246;
	
	text-rendering: optimizeLegibility;
}

 

#content
{
	font-size: 1.2em; /* 12px */
	line-height: 1.33333333333333em; /* 16px / 12px * 10px */
	 
	  
}

.has-js a,
.has-js b.dot
{
	opacity: 0;
}

/* a
{
	position: relative;

	color: #2E2246;
	text-decoration: none;
	background-color: #38D5E7;
	padding: 0.25em .5em; /* 3px/12px */
	margin-left: -0.25em; /* -3px/12px */
	
} */

h1{
	color: #FFFE37;
}

a:hover
{
	color: #FFFE37;
	background-color: transparent;
}

dt
{
	font-size: 0.75em; /* 9px/12px */
	color: #FE279E;
	margin-top: 0.33333333333333em; /* 3px/9px */
}

dd
{
	line-height: 2em; /* 18px */
	white-space: nowrap;
}

/* LAYOUT */
#content
{
	margin: 0 auto;
	padding-left: 5.66666666666667em; /* 68px/12px */
	max-width: 38.3333333333333em; /* 528px-68px/12px */
	min-width: 35.6666666666667em; /* 480px-68px+16px/12px */
}

#intro
{
	padding: 2.66666666666667em 0; /* 32px/12px */
	width: 30em; /* 312px/12px */
	clear: both;
	
	position: relative;
}

#me2
{
	position: absolute;
	top: 1.66666666666667em; /* 20px/12px */
	left: -5.3em; /* -52px/12px */
}

 

 #me
{
 margin: 0 auto;
 margin-bottom: 30px;
}


#intro-desc{
	text-align: center;
}


#copy
{
	position: absolute;
	left: -1.08333333333333em; /* -13px/12px */
}

div.section,
#output dl
{
	width: 10em; /* 120px/12px */ 
	margin: 0 1.33333333333333em 2.66666666666667em 0; /* 16px/12px 32px/12px */
	float: left;
}

#output
{
	width: 100%;
	margin: 0;
}

#output #book
{
	margin-bottom: 0;
}

#output #music
{
	width: 21.3333333333333em; /* 256px/12px */
}

.clearRow
{
	clear: both;
}

/* HEADSHOT */

#me
{
	width: 6em;  
	height: 6em;  
	background: url(me2.png) 0 0 no-repeat;
	background-size: 100% 100%;
	
	image-rendering: -webkit-optimize-contrast;
	image-rendering: -moz-crisp-edges;
	-ms-interpolation-mode: nearest-neighbor;
}

#me img { display: none; }

 

@media (max-width:1024px) {
	body
	{
		font-size: 16px;
	}
	
	#me
	{
		background-image: url(me2.png);
	}
}

@media (max-width:768px) {
	body
	{
		font-size: 14px;
	}
	
	#me
	{
		background-image: url(me2.png);
	}
}

@media (max-width:640px) {
	body
	{
		font-size: 12px;
	}
	
	#me
	{
		background-image: url(me2.png);
	}
}

@media (max-width:540px) {
	body
	{
		font-size: 10px;
	}
	
	#me
	{
		background-image: url(me2.png);
	}
}
/**/

@media (-moz-min-device-pixel-ratio: 2), (-o-min-device-pixel-ratio: 2/1), (-webkit-min-device-pixel-ratio: 2), (min-device-pixel-ratio: 2) {	
	/* Mobile Safari renders better with the default font-size */
	/* I don't add an .is-mobile-safari via JS because that causes a FOPSC */
	body
	{
		font-size: 20px;
	}
	
	#me
	{
		background-image: url(me2.png); /* extra big for retina display */
	}
}

/* ---- particles.js container ---- */

#particles-js{
  width: 100%;
  height: 100%;
   
  
  position: absolute;
}

</style>
<div id="content">	
	<div class="header">
		<div id="messageBox" class="alert alert-error ${empty message ? 'hide' : ''}"><button data-dismiss="alert" class="close">×</button>
			<label id="loginError" class="error">${message}</label>
		</div>
	</div>
	<h1 class="form-signin-heading">${fns:getConfig('productName')}</h1>
	<form id="loginForm" class="form-signin" action="${ctx}/login" method="post">
		<label class="input-label" for="username">登录名</label>
		<input type="text" id="username" name="username" class="input-block-level required" value="${username}">
		<label class="input-label" for="password">密码</label>
		<input type="password" id="password" name="password" class="input-block-level required">
		<c:if test="${isValidateCodeLogin}"><div class="validateCode">
			<label class="input-label mid" for="validateCode">验证码</label>
			<sys:validateCode name="validateCode" inputCssStyle="margin-bottom:0;"/>
		</div></c:if>
		<label for="mobile" title="手机登录"><input type="checkbox" id="mobileLogin" name="mobileLogin" ${mobileLogin ? 'checked' : ''}/></label>
		<input class="btn btn-large btn-primary" type="submit" value="登 录"/>&nbsp;&nbsp;
		<label for="rememberMe" title="下次不需要再登录"><input type="checkbox" id="rememberMe" name="rememberMe" ${rememberMe ? 'checked' : ''}/> 记住我（公共场所慎用）</label>
		<div id="themeSwitch" class="dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" href="#">${fns:getDictLabel(cookie.theme.value,'theme','默认主题')}<b class="caret"></b></a>
			<ul class="dropdown-menu">
			  <c:forEach items="${fns:getDictList('theme')}" var="dict"><li><a href="#" onclick="location='${pageContext.request.contextPath}/theme/${dict.value}?url='+location.href">${dict.label}</a></li></c:forEach>
			</ul>
			<!--[if lte IE 6]><script type="text/javascript">$('#themeSwitch').hide();</script><![endif]-->
		</div>
	</form>
	<div class="footer">
		Copyright &copy; 2016-${fns:getConfig('copyrightYear')} <a href="${pageContext.request.contextPath}${fns:getFrontPath()}">${fns:getConfig('productName')}</a> - Powered By <a href="http://datamargin.com" target="_blank">SXD</a> ${fns:getConfig('version')} 
	</div>
	<br>
	<br>
	<br>
	<br>
	<br><br>
</div>	
	<script src="${ctxStatic}/flash/zoom.min.js" type="text/javascript"></script>
</body>
</html>