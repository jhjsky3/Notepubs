console.log("header");

var CSS = {};
CSS.set = function(element, attrs){
	for(var key in attrs)
		element.style[key] = attrs[key];
}

window.addEventListener("load", function(event){
	
	// hamburger 버튼을 누를 때의 행위
	var hamButton = document.querySelector(".btn-expand");
	
	var aside = document.querySelector(".aside");
	
	hamButton.onclick = function(e){
		e.preventDefault();
		
		// aside 창을 펼치는 행위
		if(aside.classList.contains("show")){
			aside.nextElementSibling.remove();
			aside.classList.remove("show");
		}
		else{
			var screen = document.createElement("div")
			CSS.set(screen, {
				position: "fixed",
				left:"0px",
				top:"0px",
				width: "100%",
				height: "100%",
				background: "#000",
				opacity: "0.5",
				zIndex: "500"
			});
			
			screen.onclick = function(e){
				aside.classList.remove("show");
				e.target.remove();
			};
			
			aside.insertAdjacentElement('afterend', screen);
		
			aside.classList.add("show");
		}
	};
	
});