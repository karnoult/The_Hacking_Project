$("span").on("click", function() {

	let clickedCell = $(this).parent();
	let nextElement = clickedCell.next();

	clickedCell.removeClass("hide");

	if(nextElement.prop("nodeName") == "P") {
		nextElement.fadeIn();
		$(this).detach().appendTo(nextElement);
	} else {
		$(this).detach();
		$("body").css("background-image", "url(\"images/happybirthday.jpg\")");
		$("audio")[0].play();
	}

})