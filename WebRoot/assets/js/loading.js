//隐藏加载动画函数
function hideModal() {
	$('#myModal').modal('hide');
}
// 显示加载动画函数
function showModal() {
	$('#myModal').modal({
		backdrop : 'static',
		keyboard : false
	});
}
window.onload = function() {
	hideModal();
}
$(function() {
	showModal();
});