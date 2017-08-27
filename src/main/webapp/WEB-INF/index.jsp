<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>职称评审系统</title>
	<link rel="stylesheet" type="text/css" href="${rootPath}css/index.css">
    <script type="text/javascript" src="${rootPath}js/jquery-2.1.4.js"></script>
</head>
<body>
	 <div class="header">
        <div class="wrap bg">
           <div class="nav">
               <ul class="ul0">
                   <li style="margin-left:120px"><a href="${rootPath}user/Manager_relayHomePage" target="mainiframe">首页</a></li>
                   <li><a href="${rootPath}setting/Statistics_chooseRank" target="mainiframe">评议排名</a></li>
                   <li><a href="${rootPath}setting/Statistics_expertStatistics?inquiry=all" target="mainiframe">专家评议统计</a></li>
                   <li><a href="${rootPath}setting/NoticeManage_view" target="mainiframe">通知公告</a></li>
                   <li><a href=" http://www.hist.edu.cn/jgsz/xxsz.htm" target="_blank">教学机构</a></li>
                   <li>
                      <a href="${rootPath}user/Manager_toUpdate?term=myself" target="mainiframe">个人中心</a>
                      <a href="${rootPath}user/Manager_logOff" style="font-size:10px"> [退出]</a>
                   </li>
               </ul>
           </div> 
        </div>
    </div>
    	<iframe id="ifr" width="960px" height="1000px" style="margin-left:300px; border:1px solid #ccc;"  name="mainiframe" src="${rootPath}user/Manager_relayHomePage"></iframe>
</body>
<script type="text/javascript" src="${rootPath}js/index0.js"></script>
</html>