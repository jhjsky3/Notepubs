window.addEventListener("load", (e)=>{
	let main = document.querySelector(".main");
	let filterButton = main.querySelector(".filter-button");
	let toolSection = main.querySelector(".tool-section");
	let listSize = main.querySelector(".list-size");
	let regedNote = main.querySelector(".reged-note");
	
	let toolList = main.querySelector(".tool-list");
	let mc = toolList.querySelector(".mc");
	let c = toolList.querySelector(".c");
	let lang = toolList.querySelector(".lang");
	let plat = toolList.querySelector(".plat");
	let titleInput = toolList.querySelector(".title-input");
	let input = toolList.querySelector(".input");

	let pl5 = main.querySelector(".pl-5");
	let checkAll = pl5.querySelector(".check-All");
	let btnPubAll = pl5.querySelector(".btn-pub-all");
	
	let clipper = main.querySelector(".clipper");
	let noteList = clipper.querySelector(".note-list");
	let checkes = clipper.querySelectorAll("input[type=checkbox]");
	let pub = clipper.querySelector(".pub");
	//listSize 출력 ==============
	listSize.innerText = noteList.children.length; //삭제되면 바껴야한다
	
	
	//=============  api-list 집중화 ====================
	function stateChange(){
		fetch(`/api/member/note/list`)
		.then(response => response.json())
		.then(list =>{
			
			console.log(list);
			if(list.length >= 1)
				regedNote.classList.add("d-none")
			else
				regedNote.classList.remove("d-none");
				
			listSize.innerText = list.length; //노트 숫자 업데이트 
			checkAll.checked = false; //일괄선택 해제
			
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
										<a data-id="${n.id}" href="1/pub" class="pub">${n.pub == false?'공개':'비공개'}</a>
										<a data-id="${n.id}" href="1/edit" class="edit" >수정</a>
										<a data-id="${n.id}" href="1/pub" class="delete" >삭제</a>
									</div>
									<div class="info">
										<span class="c-symbol c-symbol-like text-strong">${n.likeCount}</span>
										<span class="c-symbol c-symbol-hit c-symbol-color text-strong">${n.hit}</span>
										<span class="c-symbol c-symbol-bookmark text-strong">${n.bookmarkCount}</span>
									</div>
								</section>`
								
				 noteList.insertAdjacentHTML("beforeend",section);
			}
		})
	}
	
	//필터링 검색 메소드====================
	/*function invalidate(mc,c,lang,plat,titleInput,input){
		
		console.log(`invalidate:${mc.value},${c.value},${lang.value},${plat.value},${titleInput.value},${input.value}`);
		
	};*/
	
	
	//필터링 버튼 클릭 시 필터링 도구 펼치기 ============
	filterButton.onclick=(e)=>{
		e.preventDefault();
		
		if(e.target.classList.contains("c-icon-keyboard-arrow-down")){
			filterButton.classList.replace("c-icon-keyboard-arrow-down","c-icon-keyboard-arrow-up");
			toolSection.classList.remove("d-none");	
		}
		else if(e.target.classList.contains("c-icon-keyboard-arrow-up")){
			filterButton.classList.replace("c-icon-keyboard-arrow-up","c-icon-keyboard-arrow-down");
			toolSection.classList.add("d-none");
		}
	};
	
	//필더링도구 , 필터링 기능부분
	toolList.onclick=(e)=>{
		let mc_ = mc.value || null;	
		console.log(`mc:${mc_}`);	
		console.log(lang.vlue);	
		console.log(plat.value);	
		console.log(titleInput.value);	
		console.log(input.value);	
		
		//invalidate(mc,c,lang,plat,titleInput,input);
	};
	
	//===일괄선택 체크시   ======================================
	pl5.onclick=(e)=>{
		
		if(e.target.classList.contains("check-All")){
			console.log(`일괄선택 : ${e.target.checked}`);
			console.log(`리스트 길이 : ${checkes.length}`);
			if(e.target.checked){ //일괄선택이 체크되어 있다면 checkes 선택으로 변경
				for(let i=0; i<checkes.length; i++)
					checkes[i].checked = true;
			}
			else
				for(let i=0; i<checkes.length; i++)
					checkes[i].checked = false;
		}
	
		//일괄공개 클릭 시============================
		if(e.target.classList.contains("btn-pub-all")){
			let confirm_ = confirm("정말 일괄 공개 하시겠습니까?");
				let ids = [];
				console.log(noteList.children.length);
				
				for(let i=0; i<noteList.children.length; i++){
					ids.push(noteList.children[i].dataset.id);
				}
				console.log(ids);
				console.log(btnPubAll.vlaue);
				if(confirm_ && checkAll.checked){
					console.log("일괄 공개");
					fetch(`/api/member/note/pub`,{
						method: 'POST',
						headers: {
				            'Content-Type': 'application/x-www-form-urlencoded',
				        },
						body: `ids=${ids}`
					})
					.then(response=>response.json())
					.then(result=>{
						console.log(result);
							alert("변경 되었습니다");
							stateChange();
					})
					btnPubAll.value = "일괄 비공개";
						
				}
				else if(confirm_ && !checkAll.checked) //확인은 눌렀으나 일괄선택이 안되어 있을 경우
					alert("일괄 선택 하십시오");
				else					
					console.log("취소");			
		}
		
		//일괄 삭제 클릭 시
		if(e.target.classList.contains("btn-del-all")){
			let confirm_ = confirm("정말 일괄 삭제 하시겠습니까?");
				let ides = [];
				console.log(noteList.children.length);
				
				for(let i=0; i<noteList.children.length; i++){
					ides.push(noteList.children[i].dataset.id);
				}
				console.log(ides);
			
				if(confirm_ && checkAll.checked){
					console.log("일괄 삭제");
					fetch(`/api/member/note/delete`,{
						method: 'POST',
						headers: {
				            'Content-Type': 'application/x-www-form-urlencoded',
				        },
						body: `ides=${ides}`
					})
					.then(response=>response.json())
					.then(result=>{
						console.log(result);
						console.log(ides.length);
							if(result == ides.length){
								alert("일괄 삭제 되었습니다");
								stateChange();
							}
					})
				}
				else if(confirm_ && !checkAll.checked) //확인은 눌렀으나 일괄선택이 안되어 있을 경우
					alert("일괄 선택 하십시오");
				else					
					console.log("취소");		
		}
		
	 };
	
	
	//==================  clipper  클릭시 =========================
	clipper.onclick=(e)=>{
		
		
		//리스트 체크박스 중 하나 해제시 일괄선택 해제 ======================
		if(e.target.classList.contains("mr-2")){
			for(let i=0; i<checkes.length; i++){
				console.log(`checkes.length: ${checkes.length}`)
				let checked_ = checkes[i].checked;
				console.log(`개별 체크 : ${checked_} `+(i+1));
				if(!checked_){
					checkAll.checked = false; 
				    break; // 폴스가 있다면 뒤에꺼는 확인하지 않기
				}
				else
					pl5.firstElementChild.checked = true;
			}
			
		}
		//공개버튼 눌렀을 때
		if(e.target.classList.contains("pub")){
			
			let status = e.target.innerText == "비공개"?"비공개":"공개";
			let id = e.target.dataset.id;
				console.log(id);
			let pub_ = confirm(status+" 하시겠습니까?");	
			
			if(!pub_){
				e.preventDefault();
			}
				
		}
		
		//수정버튼 눌렀을 때 // 
		if(e.target.classList.contains("edit")){
			let id = e.target.dataset.id;
				console.log(id);
			//e.preventDefault();	
			/*fetch(`/api/member/note/${id}/edit`)
			.then(response=>response.json())
			.then(result => {
				console.log(result);
			})*/
				
		}
		
		//삭제버튼 눌렀을 때 
		if(e.target.classList.contains("delete")){			
			let confirm_ = confirm("정말로 삭제하시겠습니까?");			
			if(!confirm_)
				e.preventDefault();
		}

	};
	
	
});