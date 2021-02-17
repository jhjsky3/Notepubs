window.addEventListener("load", (e)=>{
	let main = document.querySelector(".main");
	let filterButton = main.querySelector(".filter-button");
	let toolSection = main.querySelector(".tool-section");
	let toolList = main.querySelector(".tool-list");
	
	let pl5 = main.querySelector(".pl-5");
	
	let clipper = main.querySelector(".clipper");
	let noteList = clipper.querySelector(".note-list");
	let checkes = clipper.querySelectorAll("input[type=checkbox]");
	let pub = clipper.querySelector(".pub");
	
	
	//=============  api-list 집중화 ====================
	function stateChange(){
		fetch(`/api/note/member/list`)
		.then(response => response.json())
		.then(list =>{
			
			noteList.innerHTML="";
			
			
			for(let n of list){
				let section = `<section data-id="${n.id}" class="note">
									<h1><input class="mr-2" type="checkbox" >${n.title}</h1>
									<p>${n.content}</p>
									<div class="info">
										<span>카테고리 없음</span>
										<span>
										<fmt:formatDate value="${n.regDate}" pattern="yyyy-MM-dd" /> 
										</span>
									</div>
									<div class="info info-btn">
										<a data-id="${n.id}" href="1/pub" class="pub">${n.pub}</a>
										<a data-id="${n.id}" href="1/edit" class="edit" >수정</a>
										<a data-id="${n.id}" href="1/pub" class="delete" >삭제</a>
									</div>
									<div class="info">
										<span class="c-symbol c-symbol-like text-strong">${n.likeCount}</span>
										<span class="c-symbol c-symbol-hit c-symbol-color text-strong">${n.hit}</span>
										<span class="c-symbol c-symbol-bookmark text-strong">${n.bookmarkCount}</span>
									</div>
								</section>`;
								
				 noteList.insertAdjacentHTML("beforeend",section);
			}
		})
	}
	
	//필터링 버튼 클릭 시 필터링 도구 펼치기 ============
	filterButton.onclick=(e)=>{
		e.preventDefault();
		
		console.log(e.target.tagName);
		if(e.target.tagName != "A")
			return;				
		
		iconStatus = e.target.querySelector(".c-icon");
		iconStatus.classList.toggle("c-icon-keyboard-arrow-down");
		iconStatus.classList.toggle("c-icon-keyboard-arrow-up");
		toolSection.classList.toggle("d-none");
		
	};
	
	//필더링도구 , 필터링 기능부분
	toolList.onclick=(e)=>{
		console.log(e.target.name);		
	};
	
	
	
	
});