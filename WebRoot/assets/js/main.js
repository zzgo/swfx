$(document).ready(function(){

$(".nav_on a").css("color","#b62c1f");
$(".childNav dt").css("width",($("#nav li").width()));
$("#wechat").css("height",($("#wechat").width()));
$(".footer-title img").css("height",($(".footer-title img").width()));
$(".footer-title").css("width","92%");
//轮播	
var curval="0%";
var flag=true;
var timer=null;
function change(){
var li_len=$("#change li").length;	
var num=((-1*(li_len - 1)*100)+'%');
var num1=((-1*(li_len)*100)+'%');
if(curval==num){
curval="0";	
}
else{
curval=parseInt(curval)-100+'%';	
}
$("#change").stop().animate({left:curval},1000);
}
$("#leftArrow").click(function(){
var li_len=$("#change li").length;	
var num=((-1*(li_len - 1)*100)+'%');
var num1=((-1*(li_len)*100)+'%');	
if(curval=='0%'){
curval=num1;	
}	
curval=parseInt(curval)+100+'%';	
$("#change").stop().animate({left:curval},1000);	
});
$("#rightArrow").click(function(){
var li_len=$("#change li").length;	
var num=((-1*(li_len - 1)*100)+'%');
var num1=((-1*(li_len)*100)+'%');	
if(curval == num){
curval="100%";	
}	
curval=parseInt(curval)-100+'%';	
$("#change").stop().animate({left:curval},1000);	
});
timer=setInterval(change,5000);
$("#banner").mouseover(function(){
clearInterval(timer);
}).mouseout(
function(){
timer=setInterval(change,5000);	
});
});
//回到顶部动画
var backTop=document.getElementById('backTop');
var sina=document.getElementById('sina');
var wechat=document.getElementById('wechat');
var timerTop=null;
var isTop=true;	
var clientHeight=document.documentElement.clientHeight;
window.onscroll=function(){
if(!isTop){
clearInterval(timerTop);
}
isTop=false;
var osTop=document.documentElement.scrollTop||document.
body.scrollTop;
if (osTop>=clientHeight){
backTop.style.display='block';	
}	
else{
backTop.style.display='none';	
}
}
backTop.onclick=function(){
timerTop=setInterval(function(){
	var osTop=document.documentElement.scrollTop||document.body.scrollTop;
var speed=Math.floor(-osTop/5);
document.documentElement.scrollTop=document.body.scrollTop=osTop+speed;
isTop=true;
if (osTop==0) {
clearInterval(timerTop);	
}
 },30)	
} 
//文本溢出处理
function overflow(val1,val2,val3,val4,val5,val6,val7,val8,val9,val10,val11){
$('.text').each(function(){
var maxwidth=val1;
if($(this).text().length>maxwidth){
$(this).text($(this).text().substring(0,maxwidth));
$(this).html($(this).html()+'...');
}
});
$('.title a').each(function(){
var maxwidth=val2;
if($(this).text().length>maxwidth){
$(this).text($(this).text().substring(0,maxwidth));
$(this).html($(this).html()+'...');
}
});
/*
$('#campusNews>li a').each(function(){
var maxwidth=val3;
if($(this).text().length>maxwidth){
$(this).text($(this).text().substring(0,maxwidth));
$(this).html($(this).html()+'...');
}
});*/
$('#class>li a').each(function(){
var maxwidth=val4;
if($(this).text().length>maxwidth){
$(this).text($(this).text().substring(0,maxwidth));
$(this).html($(this).html()+'...');
}
});
$('#beautyRead>li a').each(function(){
var maxwidth=val5;
if($(this).text().length>maxwidth){
$(this).text($(this).text().substring(0,maxwidth));
$(this).html($(this).html()+'...');
}
});
$('.students-content-title p').each(function(){
var maxwidth=val6;
if($(this).text().length>maxwidth){
$(this).text($(this).text().substring(0,maxwidth));
$(this).html($(this).html()+'...');
}
});
$('.students-content-text p').each(function(){
var maxwidth=val7;
if($(this).text().length>maxwidth){
$(this).text($(this).text().substring(0,maxwidth));
$(this).html($(this).html()+'...');
}
});
$('.students-content-title p').each(function(){
var maxwidth=val8;
if($(this).text().length>maxwidth){
$(this).text($(this).text().substring(0,maxwidth));
$(this).html($(this).html()+'...');
}
});
$('.students-r-content-title p').each(function(){
var maxwidth=val9;
if($(this).text().length>maxwidth){
$(this).text($(this).text().substring(0,maxwidth));
$(this).html($(this).html()+'...');
}
});
$('.students-r-content-text p').each(function(){
var maxwidth=val10;
if($(this).text().length>maxwidth){
$(this).text($(this).text().substring(0,maxwidth));
$(this).html($(this).html()+'...');
}
});
$('.info-text').each(function(){
var maxwidth=val11;
if($(this).text().length>maxwidth){
$(this).text($(this).text().substring(0,maxwidth));
$(this).html($(this).html()+'...');
}
});
}
if (($(document).width())<=1024){
overflow(16,12,18,14,9,10,22,10,16,25,20);
}else{
overflow(28,20,22,30,22,12,35,12,25,55,28);	
}

// var s1=$('.time2').text();	
// var ss1=s.substr(0,7);
// $('.time2').text(ss1);
// var s2=$('.time3').text();
// var ss2=s.substr(5,5);
// $('.time3').text(ss2);
// var s3=$('.time4').text();
// var ss3=s.substr(0,4);
// $('.time4').text(ss3);
$("#mainImage").mouseover(function(){
$("#mainImage").css("width","120%");
});
//字符串截取