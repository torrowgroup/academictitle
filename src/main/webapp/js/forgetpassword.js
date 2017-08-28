/**
 * 
 */
 	function windowStart() {
 		 var urlNewPage = "/academictitle/findback.jsp";//打开的新网页的地址是 
 		 var nameNewPage = "newWindow";//打开的新网页的名字是 newWindow
 		 var heightNewPage = "600";//打开的新网页的高度
 		 var widthNewPage = "560"; //打开的新网页的宽度
 		 var optionsForNewPage = "top=210,left=650,width=" + widthNewPage + ",height=" + heightNewPage;
 		 //打开
 		 var winObj = window.open(urlNewPage, nameNewPage, optionsForNewPage,"_self");
}