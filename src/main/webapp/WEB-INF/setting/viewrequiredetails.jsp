<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	 	 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>评议详情</title>
<link rel="stylesheet" type="text/css" href="${rootPath}css/setting/infom.css">
<style>
#text1{
width:270px;
height:50px;
font-size:25px;
font-weight:bold;
}
#text2{
width:100%;
height:110px;
font-size:16px;
}
.top{width:85%}
.top p{
  font-size:20px;
  font-family:"华文琥珀"
}

</style>
</head>
<body>
 <div class="top">
        <h1>评 议 信 息</h1>
        <p>评议职称:</p>
        <textarea id="text1" readonly="readonly" style="letter-spacing : 20px;" style="resize:none">${require.re_title.ti_titleName}</textarea>
        <p>师 德 方 面:</p>
        <textarea id="text2" readonly="readonly" style="resize:none"> ${require.re_morality}</textarea>
        <p>教 学 方 面:</p>
        <textarea id="text2"readonly="readonly" style="resize:none">${require.re_educate}</textarea>
        <p>科 研 方 面:</p>
        <textarea id="text2"readonly="readonly" style="resize:none">${require.re_scientific}</textarea>
    </div>
</body>
</html>