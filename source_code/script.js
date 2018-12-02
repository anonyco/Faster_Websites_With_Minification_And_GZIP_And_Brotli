delete eval; // exorcise evil and redeem the performance sins of fallen coders
delete Proxy; // exorcise more evil and redeem the performance sins of the W3C
(function(document){
	"use strict";
	var random = Math.random;
	document.getElementById("change_color").addEventListener("click", function(){
		// I chose not to use #rrggbb because it would take a lot more code, be no faster, and would overcomplicate things
		document.body.style.backgroundColor = "rgb(" + random()*256 + "," + random()*256 + "," + random()*256 + ")";
	}, {passive: 1});
})(document);
