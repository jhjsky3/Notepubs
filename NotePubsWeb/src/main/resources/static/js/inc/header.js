console.log("header");

var CSS = {};
CSS.set = function(element, attrs){
	for(var key in attrs)
		element.style[key] = attrs[key];
}

window.addEventListener("load", function(event){
	
	// hamburger 버튼을 누를 때의 행위
	const header = document.querySelector("#header");
	var expandButton = header.querySelector(".btn-expand");
	var profileButton = header.querySelector(".btn-profile");
	
	var profileMenu = header.querySelector("#profile-menu");
	
	var aside = document.querySelector("#aside");	
	
	expandButton.onclick = function(e){
		e.preventDefault();
				
		// aside 창을 펼치는 행위
		if(aside.classList.contains("expand")){
			aside.nextElementSibling.remove();
			aside.classList.remove("expand");
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
				opacity: "0",
				zIndex: "2500",
				transition:"opacity 0.5s"
			});
			
			screen.onclick = function(e){
				aside.classList.remove("expand");
				e.target.remove();
			};
			
			//screen.addEventListener('transitionend', ()=>{
				aside.classList.add("expand");
			//});	
			
			aside.insertAdjacentElement('afterend', screen);		
		
			setTimeout(()=>{
				CSS.set(screen, {				
					opacity: "0.6"
				});
			});			
			
			
		}
	};
	
	if(profileButton != null)	
	profileButton.onclick = function(e){
		e.preventDefault();
		profileMenu.classList.toggle("d-none");
	}
});