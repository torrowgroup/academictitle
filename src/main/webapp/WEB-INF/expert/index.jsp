<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>评职称</title>
<link rel="stylesheet" type="text/css" href="${rootPath}css/index.css">
</head>
<body>
<marquee behavior="scroll">
				<p>${noticeNew.no_content}</p>
			</marquee>
	<center>		
		<a href="${rootPath}expert/ExpertDiscussAction_noDiscuss?inquiry=all" target="mainFrame">未评</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="${rootPath}expert/ExpertDiscussAction_alreadyDiscuss?inquiry=all" target="mainFrame">已评</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="${rootPath}expert/ExpertNotice_allNotice?inquiry=all" target="mainFrame">查看通知</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="${rootPath}expert/ExpertPersonal_myselfMessage" target="mainFrame">个人中心</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="${rootPath}expert/ExpertPersonal_logOff">退出</a>
	</center>
<iframe id="ifr" width="1500px" height="500px" name="mainFrame"></iframe>
</body>
</html>