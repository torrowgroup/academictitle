<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	 	 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>通知管理</title>
<link rel="stylesheet" type="text/css" href="${rootPath}css/setting/infom.css">
</head>
<body>
 <div class="top">
        <h1>通知信息</h1>
        <p>通知名称:</p>
        <textarea id="text1"readonly="readonly">${notice.no_head}</textarea>
        <p>通知详情:</p>
        <textarea id="text2" readonly="readonly" >${notice.no_content}</textarea>
    </div>
</body>
</html>