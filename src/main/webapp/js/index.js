function $(id){
    return document.getElementById(id);
}
window.onload=function(){
    var timer=null;
    var mydate=new Date();
    var year=mydate.getFullYear();
    var month=mydate.getMonth()+1;
    var dat=mydate.getDate();
    var d=mydate.getDay();
    var days=["星期日","星期一","星期二","星期三","星期四","星期五","星期六"];
    var date=document.getElementById('date');
    date.innerHTML='今天是：'+year+'-'+month+'-'+dat+' '+days[d];
}


function pub(obj){
    var speed=obj.offsetHeight;
     if (obj.style.display=='block') {
            hide(obj,speed);
        }else{
           move(obj,speed);
        }
   }

function move(obj,speed){
    var spans=document.getElementsByTagName('span');
    var uls=document.getElementsByTagName('ul');
    var maxh=120;
    function auto(){
    speed+=15;
    if (speed>maxh) {
        clearInterval(timer);
    }else{
        obj.style.display='block';
        obj.style.height=speed+'px';
    }
  }
  timer=setInterval(auto,30);

}
function hide(obj,speed){
    var minh=0;
    function auto(){
        speed-=15;
    if (speed<=minh) {
        clearInterval(timer);
        obj.style.display='none';
    }else{
        obj.style.height=speed+'px';
    }
  }
  timer=setInterval(auto,30);
}
