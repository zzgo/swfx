//tab文字动画
$(".nm_ul li").mouseover(function(){
var i=$(this).index(this);	
$(this).eq(i).stop().animate({textIndent:"20px"},200,'linear');}).mouseout(function(){
var i=$(this).index(this);	
$(this).eq(i).stop().animate({textIndent:"0"},200,'linear');
});
function overflow(val1,val2,val3,val4,val5,val6,val7){
$('.news-content').each(function(){
var maxwidth=val1;
if($(this).text().length>maxwidth){
$(this).text($(this).text().substring(0,maxwidth));
$(this).html($(this).html()+'...');
}
});
/**通知公告哪里的*/        
/*$('.nm_ul li a').each(function(){
var maxwidth=val2;
if($(this).text().length>maxwidth){
$(this).text($(this).text().substring(0,maxwidth));
$(this).html($(this).html()+'...');
}                     
});*/
$('.article-box>ul>li a').each(function(){
var maxwidth=val3;
if($(this).text().length>maxwidth){
$(this).text($(this).text().substring(0,maxwidth));
$(this).html($(this).html()+'...');
}
});
$('#newsmsg>li a').each(function(){
var maxwidth=val4;
if($(this).text().length>maxwidth){
$(this).text($(this).text().substring(0,maxwidth));
$(this).html($(this).html()+'...');
}
});
$('.news-t>a').each(function(){
var maxwidth=val6;
if($(this).text().length>maxwidth){
$(this).text($(this).text().substring(0,maxwidth));
$(this).html($(this).html()+'...');
}
});
$('.news-content').each(function(){
var maxwidth=val5;
if($(this).text().length>maxwidth){
$(this).text($(this).text().substring(0,maxwidth));
$(this).html($(this).html()+'...');
}
});
$('#contents>ul>li a').each(function(){
var maxwidth=val7;
if($(this).text().length>maxwidth){
$(this).text($(this).text().substring(0,maxwidth));
$(this).html($(this).html()+'...');
}
});
}
/*if (($(document).width())>=1550){
overflow(100,20,20,30,100,15,10);	
}
if (($(document).width())>1300 && ($(document).width())<1550){
overflow(100,20,20,30,85,15,6);	
}
if (($(document).width())<=1300){
overflow(100,20,20,20,80,15,6);	
}
if (($(document).width())<=1100){ 
overflow(100,20,20,20,65,15,4);	
}
if (($(document).width())<=1024){
overflow(50,10,12,15,40,10,4);
}*/
$(".disabled").attr('href','javascript:;');