<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script language="javascript">
        //防止页面后退
       history.pushState(null, null, document.URL);
       window.addEventListener('popstate', function () {
       history.pushState(null, null, document.URL);
        });
        window.location.href="${rootPath}user/Manager_out";
</script>
</head>
<body>
</body>
</html>