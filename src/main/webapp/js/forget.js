/**
 * 
 */
window.onload=clock;
function closewin() {
	self.opener = null;
	self.close();
}
function clock() {
	i = i - 1
	document.title = "本窗口将在" + i + "秒后自动关闭!";
	if (i > 0)
		setTimeout("clock();", 2000);
	else
		closewin();
	}
	var i = 90
	clock();