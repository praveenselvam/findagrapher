// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require lib/jquery
//= require lib/jquery.masonry.js
//= require lib/bootstrap/modal.js
//= require_tree .

$(function(){

	$(document).on('click', '#login', function(e){
		e.preventDefault();
		var el = $(this).hide(),
				message = el.siblings('.login-message').show();

		FB.login(function(response) {
			if (response.authResponse) {
				//	Logged in.
			} else {
				console.log('User cancelled login or did not fully authorize.');
				el.show();
				message.hide();
			}
		});
	});

	$('#logout').click(function(e){
		e.preventDefault();
		FB.logout(function(response) {
			// no-op
		});
	});
});