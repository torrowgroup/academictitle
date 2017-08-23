<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="${rootPath}css/index0.css">
    <script type="text/javascript" src="${rootPath}js/jquery-2.1.4.js"></script>
</head>
<body>
	 <div class="header">
        <div class="wrap bg">
           <div class="nav">
               <ul class="ul0">
                   <li style="margin-left:42px"><a href="${rootPath}user/Manager_relayHomePage" target="mainiframe">首页</a></li>
                   <li><a href="#">评议排名</a></li>
                   <li><a href="#z">评议统计</a></li>
                   <li><a href="${rootPath}setting/NoticeManage_view" target="mainiframe" >通知公告</a></li>
                   <li><a href="#">资料下载</a></li>
                   <li><a href="#">信箱</a></li>
                   <li>
                      <a href="#">个人中心</a>
                      <a href="#" style="font-size:10px"> [退出]</a>
                   </li>
               </ul>
           </div> 
        </div>
    </div>
    	<iframe id="ifr" width="1519px" height="1000px" style="margin-top:0px;"  name="mainiframe"></iframe>
</body>
<script type="text/javascript" src="${rootPath}js/index0.js"></script>
</html>