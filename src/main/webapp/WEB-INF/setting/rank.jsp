<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="${rootPath}css/setting/rank.css">
    <link rel="stylesheet" type="text/css" href="${rootPath}css/setting/bootstrap.css">
    <script type="text/javascript" src="${rootPath}js/jquery-2.1.4.js"></script>
    <script type="text/javascript" src="${rootPath}js/bootstrap.js"></script>
</head>
<body>
	<div class="tilp">${message}</div>
	 <div class="wall">
        <div class="list">
            <ul>
                <span style="padding-left:0px;font-size:18px">选择查看排名方式 :</span>
                <li>按职称排名
                   <div class="hide-box">
                       <c:forEach items="${allTitle}" var="allTitle">
							<a href="${rootPath}setting/Statistics_rank?ask=title&inquiry=${allTitle.ti_titleName}">${allTitle.ti_titleName}</a>
						</c:forEach>
                   </div>
                </li>
                <li>按专业排名
                    <div class="hide-box">
                    	<c:forEach items="${allMajors}" var="allMajors">
							<a href="${rootPath}setting/Statistics_rank?ask=major&inquiry=${allMajors.maj_majorName}">${allMajors.maj_majorName}</a>
						</c:forEach> 
                   </div>
                </li>
                <li>按单位排名
                    <div class="hide-box">
                     <c:forEach items="${allUnit}" var="allUnit">
						<a href="${rootPath}setting/Statistics_rank?ask=unit&inquiry=${allUnit.un_unitName}">${allUnit.un_unitName}</a>
					</c:forEach>
                   </div>
                </li>
                <span><a style="font-size:12px;color:#999" href="${rootPath}setting/Statistics_empty">清空评议记录</a></span>
            </ul>
        </div>
        <c:if test="${fn:length(discussRank.data) > 0 }">
        <table border="1" cellspacing="0">
            <tr>
                <th>参评人</th>
                <th>熟悉型得分</th>
                <th>比较熟悉型得分</th>
                <th>不太熟悉型得分</th>
                <th>模糊排名</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${discussRank.data}" var="rank">
					<tr>
						<td>${rank.di_participator.pa_name}</td>
						<td>${rank.di_averageA}</td>
						<td>${rank.di_averageB}</td>
						<td>${rank.di_averageC}</td>
						<td>${rank.di_rank}</td>
						<td><a href="${rootPath}setting/Statistics_discussDetails?inquiry=${rank.di_id}">查看详情</a></td>
					</tr>
				</c:forEach>
        </table>
        <div class="page" id="div2">
				<ul class="pagination">
					<li><a
						href="${rootPath }setting/Statistics_rank?page=${discussRank.prePage}">上一页</a></li>
					<c:forEach var="i"
						begin="${discussRank.currentPage-3>0?discussRank.currentPage-3:1 }"
						end="${discussRank.currentPage+3>discussRank.pageNum?discussRank.pageNum:discussRank.currentPage+3  }">
						<c:choose>
							<c:when test="${i>0 && i == discussRank.currentPage}">
								<li class="active"><a
									href="${rootPath }setting/Statistics_rank?page=${i }">${i}</a></li>
							</c:when>
							<c:when test="${i>0 && i != discussRank.currentPage}">
								<li><a
									href="${rootPath }setting/Statistics_rank?page=${i }">${i}</a></li>
							</c:when>
						</c:choose>
					</c:forEach>
					<li><a
						href="${rootPath }setting/Statistics_rank?page=${discussRank.nextPage}">下一页</a></li>
				</ul>
			</div>
			</c:if>
    </div>
</body>
</html>