/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(window).scroll(function () {
	var sc = $(window).scrollTop()
	if (sc > 150) {
		$("#main-navbar").addClass("navbar-scroll")
	} 
	else {
		$("#main-navbar").removeClass("navbar-scroll")
	}
});
