<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>职称评审系统</title>
<link rel="stylesheet" type="text/css" href="${rootPath}css/expert/index.css">
<link rel="stylesheet" type="text/css" href="${rootPath}css/expert/public.css">
<link rel="stylesheet" type="text/css" href="${rootPath}css/expert/bootstrap.css">
<script type="text/javascript" src="${rootPath}js/jquery-2.1.4.js"></script>
<script type="text/javascript" src="${rootPath}js/bootstrap.js"></script>
</head>
<body>
	<div class="notice">
	<marquee behavior="scroll">
				<p>${noticeNew.no_content}</p>
	</marquee>
	</div>
	<div class="box" style="margin-top:55px;">
		<img src="${rootPath}images/nail-1.gif" class="left"> <img
			src="${rootPath}images/nail-2.gif" class="right">
		<div class="text">
			职称评审系统
			<span>
			  <i>欢迎${expert.ex_name}登录</i>
			  <a href="${rootPath}expert/ExpertPersonal_logOff" title="退出登录" >
               <img src="${rootPath}images/logout.jpeg" height="20px;" width="20px;"/><span style="font-size:10px;padding-top:7px;">[退出]</span>
             </a>
           </span>
		</div>
		<div class="content">
			<!-- 查看通知开始 -->
			<a href="${rootPath}expert/ExpertNotice_allNotice?inquiry=all">查看通知</a><br>
		</div>
		<!-- 查看通知结束 -->
		<div class="content">
			<a href="${rootPath}expert/ExpertDiscussAction_noDiscuss?inquiry=all">未评人员</a><br>
		</div>
		<div class="content">
			<a href="${rootPath}expert/ExpertDiscussAction_alreadyDiscuss?inquiry=all">已评人员</a><br>
		</div>
		<div class="content">
			<a href="${rootPath}expert/ExpertPersonal_myselfMessage">个人中心</a><br>
		</div>
		<div class="content">
			<!-- 评审政策内容开始 -->
			<a href="">评审政策</a><br>
			<div class="bot">
				<span style="float: left; margin-left: 26px"><img
					src="${rootPath}images/dot-2.png">公开&nbsp;&nbsp;公平&nbsp;&nbsp;公正</span><br>
				
				<span style="float: left; margin-left: 25px"><img
					src="${rootPath}images/dot-2.png">参加评审的专家必须准确把握<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;标准和条件,给出客观的评价</span>
					<span style="float: left; margin-left: 25px;"><img
					src="${rootPath}images/dot-2.png">根据通知时间按时按质评审</span><br>
			</div>
		</div>
		<!-- 评审政策内容结束 -->

		<div class="content" style="width: 28%">
			<a href="">帮助中心</a><br>
			<div class="bot">

				<span style="float: left; margin-left: 30px"><img
					src="${rootPath}images/dot-2.png">电话：400-456-4895</span><br> <span
					style="float: left; margin-left: 30px"><img
					src="${rootPath}images/dot-2.png">手机：15560098856</span><br> <span
					style="float: left; margin-left: 30px"><img
					src="${rootPath}images/dot-2.png">邮箱：266845555@qq.com</span><br>
			</div>
		</div>
	</div>
</body>
</html>