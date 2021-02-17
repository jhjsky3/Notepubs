/**
 * 
 */


$(()=>{
	const noteSection = document.querySelector(".note-section");
	const noteList = noteSection.querySelector(".note-list");
	const notePrevButton = noteSection.querySelector(".btn-note-prev");
	const noteNextButton = noteSection.querySelector(".btn-note-next");
	
	let listLeft = 0;
	
	noteList.style.transition="transform .5s";
	
	noteList.ontouchend = e => {
		
		let scrollLeft = noteList.parentElement.scrollLeft;
		
		let offsetLeft = scrollLeft % 250;
		offsetLeft = Math.round(offsetLeft);
		scrollLeft += offsetLeft;
		console.log(scrollLeft);
		
		//noteList.style.transform = `translateX(${listLeft}px)`;
		
	};
	
	notePrevButton.onclick = e => {
		e.preventDefault();
		
		
		if(listLeft >= 0)
			return;
		
		listLeft += 250 + 20;
		noteList.style.transform = `translateX(${listLeft}px)`;
	};
	
	noteNextButton.onclick = e => {
		e.preventDefault();
		listLeft -= 250 + 20;
		noteList.style.transform = `translateX(${listLeft}px)`;
	};
	
	
	
	
	console.log($(".todays-book").width());
	let pageWrapper = $(".page-wrapper");	
	let todaysBook = $(".todays-book");
	
	let id = null;
	let oldWidth = todaysBook.width();
	let diffWidth = 0;

	window.addEventListener("resize", (e)=>{
		
		if(id != null)
			clearTimeout(id);
		
		id = setTimeout(() => {
			let newWidth = todaysBook.width();
			diffWidth = Math.abs(newWidth-oldWidth);
			
			if(diffWidth > 50)
				location.reload();
			
			id = null;
		}, 300);
		
	});
	
	console.log("loaded");
	let width = oldWidth;
	
	$(".flip-note-list").turn({
		width: width,
		height: 500,
		autoCenter: true,
		turnCorners:"bl,br",
		display:"single"
	});
});


