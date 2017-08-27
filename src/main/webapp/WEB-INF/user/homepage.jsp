<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>职称评审系统</title>
	<link rel="stylesheet" type="text/css" href="${rootPath}css/index.css">
    <script type="text/javascript" src="${rootPath}js/jquery-2.1.4.js"></script>
</head>
<body>
	 <!-- 轮播 -->
    <div class="pic">
        <div class="pos">
            <ul id="list">
                <li style="display:block">
                   <img src="${rootPath}images/01.png" style="border-radius:5px">
                </li>
                <li>
                   <img src="${rootPath}images/02.jpg">
                </li>
                <li>
                   <img src="${rootPath}images/04.png">
                </li>
                <li>
                   <img src="${rootPath}images/05.png">
                </li>
            </ul>
        </div>    
    </div>
    <div class="box">
         <div id="banner-list">
            <a class="active" href="#"></a>
            <a href="#"></a>
            <a href="#"></a>
            <a href="#"></a>
        </div>
    </div>
    <div class="wrap lis">
        <table cellspacing="0" width="100%" align="center" style="margin-top:15px;">
            <tr>
                <td width="60"></td>
                <td>
                    <img src="${rootPath}images/b-3.gif">
                </td>
                <td>
                    <img src="${rootPath}images/b-1.gif">
                </td>
                <td>
                    <img src="${rootPath}images/b-5.gif">
                </td>
                <td>
                    <img src="${rootPath}images/b-6.png">
                </td>
                <td>
                    <img src="${rootPath}images/b-7.png">
                </td>
                <td>
                    <img src="${rootPath}images/b-4.png">
                </td>
                <td>
                    <img src="${rootPath}images/b-2.png">
                </td>
            </tr>
            <tr>
                <td width="60"></td>
                <td height="40"><a href="${rootPath}user/Participator_select?ask=all" target="mainiframe" style="padding-left:6px">参评人</a></td>
                 <td><a href="${rootPath}user/Expert_select?ask=all" target="mainiframe" style="padding-left:12px">专家</a></td>
                <td><a href="${rootPath}user/Manager_select?ask=all" target="mainiframe" style="padding-left:6px">管理员</a></td>
                 <td><a href="${rootPath}setting/MajorsManage_view"  target="mainiframe" style="padding-left:12px">专业</a></td>
                <td><a href="${rootPath}/setting/TitleManage_view" target="mainiframe" style="padding-left:12px">职称</a></td>
               <td><a href="${rootPath}setting/DepartmentManage_view" target="mainiframe" style="padding-left:12px">单位</a></td>
                <td><a href="${rootPath}setting/ReviewRequirementsManage_view" target="mainiframe">评议要求</a></td>
            </tr>
        </table>
    </div>
    <div class="wrap info-box">
    <!-- 上部分 -->
        <div class="info1">
            <div style="margin:0" class="box1">
                <div class="info-title">
                    <span>通知公告</span>
                    <a style="font-size:12px;float:right" href="${rootPath}setting/NoticeManage_view" target="mainiframe">+更多</a>
                </div>
                <div class="info-text">
                <c:forEach items="${someNotice}" var="items">
                	<div class="title-txt">
                        <div class="titie-b"><img src="${rootPath}images/point.jpg">
                             <a href="${rootPath}setting/NoticeManage_viewDetail?noticeId=${items.no_id}" target="mainiframe">${items.no_head}</a>
                        </div>
                        <div class="titie-w"><font style="color:#f30">${items.no_issueData}</font>
                        </div>
                    </div>
                </c:forEach>
                </div>
            </div>
            <div class="box1">
                <div class="info-title">
                    <span>职称相关</span>
                    <a  href="${rootPath}setting/ReviewRequirementsManage_view" style="font-size:12px;float:right" >+更多</a>
                </div>
               <div class="info-text">
               <c:forEach items="${require}" var="items">
               		<div class="title-txt">
                        <div class="titie-b"><img src="${rootPath}images/point.jpg">
                             <a href="${rootPath}setting/ReviewRequirementsManage_getDetails?requireId=${items.re_id}">关于${items.re_title.ti_titleName}的评议要求</a>
                        </div>
                    </div>
               </c:forEach>
                </div>
            </div>
            <div class="box1">
                <div class="info-title">
                    <span>评审政策</span>
                    <a style="font-size:12px;float:right" href="#">+更多</a>
                </div>
                <div class="info-text">
                    <div class="title-txt">
                        <div class="titie-b"><img src="${rootPath}images/point.jpg">
                             <a href="#">豫职改办〔2017〕37号关于新乡市员继续教育,提升教学质量有关问题的通知</a>
                        </div>
                    </div>
                     <div class="title-txt">
                        <div class="titie-b"><img src="${rootPath}images/point.jpg">
                             <a href="#">豫职改办〔2017〕17号关于新乡市员继续教育,提升教学质量有关问题的通知</a>
                        </div>
                    </div>
                     <div class="title-txt">
                        <div class="titie-b"><img src="${rootPath}images/point.jpg">
                             <a href="#">豫职改办〔2017〕7号关于新乡市员继续教育,提升教学质量有关问题的通知</a>
                        </div>
                    </div>
                     <div class="title-txt">
                        <div class="titie-b"><img src="${rootPath}images/point.jpg">
                             <a href="#">豫职改办〔2017〕3号关于新乡市员继续教育,提升教学质量有关问题的通知</a>
                        </div>
                    </div>
                     <div class="title-txt">
                    </div>
                </div>
            </div>
        </div>
    </div>
     <div class="wrap">
        <div class="footer-top">
              <div class="foot-l">
                  <img src="${rootPath}images/bg-8.png" style="margin-left:-2px;">
              </div>  
              <div class="foot-m">
                   <div class="center">
                       <span>@技术服务支持电话：<strong>0991-2887709、3193615</strong><br>QQ群:18738357910</span>
                   </div>
              </div>  
        </div>
     </div>
     <div class="foot">
         <div class="wrap">
             <div class="f-l">
                 <h4>网站信息</h4>
                 <p>系统ICP备案号：新ICP备10002072号<br>技术支持：河南艾未特网络有限公司<br>主办公司：未来小组</p>
             </div>
             <div class="f-l">
                 <h4>服务中心</h4>
                 <p>政策咨询：<span>15601266895</span><br>
                    绑定微信：18738357910<br>
                     在线问答：http://www.hist.edu.cn/
                 </p>
             </div>
             <div class="f-l">
                 <h4>微信公众号</h4>
                 <p><img src="${rootPath}images/QRcode.jpg" width="70"></p>
             </div>
         </div>
     </div>
</body>
<script type="text/javascript" src="${rootPath}js/index0.js"></script>
</html>