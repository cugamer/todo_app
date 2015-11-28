$(function () {
  $('.toggle').click(function (event) {
    console.log("running")
  	event.preventDefault();
  	var target = $(this).attr('href');
  	$(target).toggleClass('hidden show');
  });
});