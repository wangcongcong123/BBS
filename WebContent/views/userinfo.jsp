<%@page import="com.bbs.entities.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="cn">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1,user-scalable=0">
<title>我的个人信息</title>
</head>

<link rel="stylesheet" href="asserts/weui/css/weui.css" />
<link rel="stylesheet" href="asserts/weui/css/weui2.css" />
<link rel="stylesheet" href="asserts/weui/css/weui3.css" />
<link rel="stylesheet" href="asserts/layui/css/layui.css" />
<body>
<body ontouchstart style="background-color: #f8f8f8;">


	<div class="weui-header bg-green">
		<div class="weui-header-left">
			<a class="icon icon-109 f-white" href="user-login">返回</a>
		</div>
		<h1 class="weui-header-title">用户信息</h1>
		<div class="weui-header-right">
			<a href="user-login" class="icon icon-27 f-white"></a>
		</div>
	</div>





	<div class="page-hd">


		<div class="tcenter">
			<form action="user-uploadAvatar" method="post" id="myupload"
				enctype="multipart/form-data">

				<a id="upload_face">
					<%
						User user = (User) request.getSession().getAttribute("user");
						if (user.getAvatar() == null || user.getAvatar().equals("")) {
					%> <img id="face_img"
					style="border-radius: 100%; width: 100px; height: 100px;"
					src="asserts/images/faces/wechat.gif"> <%
 	} else {
 %> <img
					id="face_img"
					style="border-radius: 100%; width: 100px; height: 100px;"
					src="/src/${session.user.avatar}"> <%
 	}
 %>
				</a> <input type="file" name="face" accept="image/*" hidden>
			</form>
			<br> <a href="user-creditHistory" style="width: 100%;">
				<p style="font-size: 15px">
					<b>${session.user.name} </b> <img src="id.png" width="20px"
						height="20px"> <b class="level" style="color: #47B33A;">V${session.user.level}</b>
				</p>
				<p style="color: #47B33A; font-size: 10px">点击进入会员中心</p>
			</a>


		</div>
	</div>
	<input style="display: none" class="upload_face" type="image">

	<div class="weui_panel weui_panel_access">
		<div class="weui_panel_hd">账号信息</div>

		<div class="weui_panel_bd">
			<div class="weui_media_box weui_media_text">




				<a id="phone-number">
					<h4 class="weui_media_desc" style="float: right">${session.user.phoneNumber }</h4>
					<h4 class="weui_media_desc f-black">手机号/账号:</h4>
				</a>

			</div>


			<div class="weui_media_box weui_media_text">

				<h4 class="weui_media_desc" style="float: right">${session.user.identityId }</h4>
				<h4 class="weui_media_desc f-black">身份证号:</h4>

			</div>

			<div class="weui_media_box weui_media_text">
				<h4 class="weui_media_desc" style="float: right">${session.user.gender}</h4>
				<h4 class="weui_media_desc f-black">性别:</h4>
			</div>

		</div>
		
		<a href="user-qrCode" class="weui_panel_ft f-black">我的个人二维码</a>
		<a href="javascript:void(0);" class="weui_panel_ft f-black"
			id="check-login-history">我的登录历史</a>
					<a href="user-myFavorites" class="weui_panel_ft f-black"
			id="check-favorite">我的收藏</a> 
			  <a href="moreUserInfo.jsp" class="weui_panel_ft f-black">更多个人资料</a>
			
			

	</div>

	<div class="weui_panel weui_panel_access">
		<div class="weui_panel_hd">人脸识别</div>

		<a href="faceSample.jsp" class="weui_panel_ft f-black">我的人脸</a>

	</div>

	<div class="weui_panel weui_panel_access">
		<div class="weui_panel_hd">更多</div>

		<a href="user-settings" class="weui_panel_ft f-black">个人设置</a>

	</div>
	<div class="page-bd-15" style="display: none" id="login-history">
		<div class="timeline">
			<ul>
				<li class="timeline-item">
					<div class="timeline-item-head-first">
						<i
							class="weui_icon weui_icon_success_no_circle timeline-item-checked"></i>
					</div>
					<div class="timeline-item-tail"></div>
					<div class="timeline-item-content">
						<h4 class="recent"></h4>
						<p class="recent"></p>
					</div>
				</li>


				<li class="timeline-item">
					<div class="timeline-item-head">
						<i
							class="weui_icon weui_icon_success_no_circle timeline-item-checked hide"></i>
					</div>
					<div class="timeline-item-tail"></div>
					<div class="timeline-item-content"></div>
				</li>

			</ul>
		</div>
	</div>



	<div style="height: 100px">&nbsp;</div>
	<div class="weui-footer-fixed-bottom page-bd"
		style="position: fixed; bottom: 0px; width: 100%">
		<div class="weui_panel weui_panel_access">
			<div class="weui_panel_bd">
				<div class="weui_media_box weui_media_text">
					<p class="weui_media_desc">
						<a href="javascript:;" class="weui_btn bg-red" id="switch">退出登录</a>
					</p>
				</div>
			</div>
		</div>
	</div>
	<div id="face-div" style="display: none; text-align: center">
		<img id="face-img">
	</div>


</body>





<script src="asserts/weui/js/zepto.min.js"></script>
<script src="asserts/layui/layui.js"></script>
<script>
	$(function() {
		layui
				.use(
						'layer',
						function() {

							var layer = layui.layer;
							$("#check-login-history")
									.click(
											function() {
												//TODO AJAX goes here
												var timeline_list = '';
												$
														.ajax({
															type : 'POST',
															url : 'user-checkLogs',
															data : {
																'fre' : $(this)
																		.val()
															},
															dataType : 'json',
															success : function(
																	data) {
																var logs = JSON
																		.parse(data.logs);
																//ajax 请求成功后，返回按时间由最近到过去排序的历史登录数据list，第一条的动态变量填入下面的string的［］中，动态化
																var len = logs.length;

																timeline_list = '	<li class="timeline-item"> <div class="timeline-item-head-first"> <i class="weui_icon weui_icon_success_no_circle timeline-item-checked"></i> </div> <div class="timeline-item-tail"></div> <div class="timeline-item-content"> <h4 class="recent">['
																		+ logs[len - 1].user.name
																		+ '] 您最近一次登录地点是 ［'
																		+ logs[len - 1].area
																		+ '］ </h4> <p class="recent">［'
																		+ getDate(logs[len - 1].logAt.time)
																		+ '］</p> </div> </li>';
																//第二条至倒数第二条后面的填入下面的string的［］中，动态化
																if (len >= 3) {
																	for (var i = len - 2; i > 0; i--) {
																		timeline_list += '   <li class="timeline-item"> <div  class="timeline-item-head"> <i class="weui_icon weui_icon_success_no_circle timeline-item-checked hide" ></i> </div> <div class="timeline-item-tail" ></div> <div class="timeline-item-content"> <h4>［'
																				+ logs[i].user.name
																				+ '］ 您在 ［'
																				+ logs[i].area
																				+ '］ 登录了一次 </h4><p>［'
																				+ getDate(logs[i].logAt.time)
																				+ '］</p></div> </li>';
																	}
																}
																//最后一条的填入下面的string的［］中，动态化
																timeline_list += '   <li class="timeline-item"> <div  class="timeline-item-head"> <i class="weui_icon weui_icon_success_no_circle timeline-item-checked hide" ></i> </div> <div class="timeline-item-tail hide" ></div> <div class="timeline-item-content"> <h4>［'
																		+ logs[0].user.name
																		+ '］ 您在 ［'
																		+ logs[0].area
																		+ '］ 登录了一次 </h4><p>［'
																		+ getDate(logs[0].logAt.time)
																		+ '］</p></div> </li>';
																$(
																		".timeline ul")
																		.html(
																				timeline_list);
															},
															error : function() {
																alert("服务器错误");
															}
														});

												layer
														.open({
															type : 1,
															title : '登录历史',
															content : $('#login-history'),
															btn : [ '关闭' ],
															area : [ '300px',
																	'400px' ],
															btn1 : function(
																	index) {

																layer
																		.close(index);

															}
														});

											});
						});
		$(".upload_face").change(function() {

		});

		$("select[name='select2']").change(function() {
			//TODO
			$.toast("fre is changed=>>>>" + $(this).val());
		});

		$("#upload_face").click(function() {

			$.actions({
				title : "选择操作",
				onClose : function() {
					console.log("close");
				},
				actions : [ {
					text : "查看",
					className : "color-primary",
					onClick : function() {

						var imgUrl = $("#face_img").attr('src');
						$('#face-img').attr("src", imgUrl);
						$('#face-img').attr("width", '70%');

						layer.open({
							type : 1,
							title : '头像',
							shadeClose : true,
							content : $('#face-div'),
							shade : 0.6,
							btn : [ '确定' ],
							area : [ '300px', '400px' ]
						});
					}
				}, {
					text : "上传头像",
					className : 'color-danger',
					onClick : function() {
						$("input[name='face']").trigger('click');
					}
				} ]
			});

		});
		function getObjectURL(file) {
			var url = null;
			// 下面函数执行的效果是一样的，只是需要针对不同的浏览器执行不同的 js 函数而已
			if (window.createObjectURL != undefined) { // basic
				url = window.createObjectURL(file);
			} else if (window.URL != undefined) { // mozilla(firefox)
				url = window.URL.createObjectURL(file);
			} else if (window.webkitURL != undefined) { // webkit or chrome
				url = window.webkitURL.createObjectURL(file);
			}
			return url;
		}

		$("input[name='face']").change(function() {
			var firstfile = this.files[0];

			if (!firstfile.name.match(/.jpg|.gif|.png|.jpeg|.bmp/i)) {
				return layer.msg("您上传的图片格式不正确，请重新选择！", {
					icon : 2,
					anim : 6,
					time : 1000
				});

			}
			var size = 2 * 1024 * 1024;

			if (firstfile.size > size) {
				layer.msg("上传失败，请上传2MB以内的图片。", {
					icon : 2,
					anim : 6,
					time : 1000
				});
				return;
			}

			var faceUrl = getObjectURL(firstfile);

			var ori = $("#face_img").attr("src");

			$("#face_img").attr("src", faceUrl);

			$.confirm("你确认上传改头像?", "确认上传", function(text) {

				$("#myupload").submit();

			}, function() {
				$("#face_img").attr("src", ori);

			});
		});

		$("#switch").click(function() {
			$.confirm("确定要注销当前帐号吗？", "注销确认", function(text) {
				window.location.href = "user-logout";
			}, function() {

			});
		});
	});
	function getDate(time) {
		var d = new Date(time);
		var str = d.getUTCFullYear() + '年' + (d.getUTCMonth() + 1) + '月'
				+ d.getUTCDate() + '日' + d.getHours() + '时' + d.getUTCMinutes()
				+ '分' + d.getUTCSeconds() + '秒';
		return str;
	}
</script>


</body>
</html>