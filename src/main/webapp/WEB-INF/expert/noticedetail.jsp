<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>通知详情</title>
<link rel="stylesheet" type="text/css" href="${rootPath}css/expert/noticedetail.css">
<link rel="stylesheet" type="text/css" href="${rootPath}css/expert/public.css">
<link rel="stylesheet" type="text/css" href="${rootPath}dist/css/wangEditor.min.css">
</head>
<body>
<div class="box">
		<img src="${rootPath}images/nail-1.gif" class="left"> <img
			src="${rootPath}images/nail-2.gif" class="right">
	<div class="back">
		<<<a href="#" onclick="JavaScript:history.back(-1);">返回上一级</a>
	</div>
	 <div class="top">
        <div class="top-l">
            <span>标题:</span>
            <i>${notice.no_head}</i>
        </div>
        <div class="top-m">
            <div class="testareadiv">
            	<textarea readonly="readonly" >${notice.no_content}</textarea>
            </div>
            <span id="time">${notice.no_issueData}</span>
        </div>
    </div>
    </div>
	</body>
</html>