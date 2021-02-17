window.addEventListener("load", (e)=>{
	const input = document.querySelector("input[type=text]");
	const memberList = document.querySelector(".member-list");
	var pl3 = document.querySelector(".pl-3");
	var mt4 = document.querySelector(".mt-4");
	
	var bc1 = true;
	var bc2 = true;
	var bc3 = true;
	
	var pagerList= document.querySelector(".pager-list");
	var prevPage= document.querySelector(".prev-page");
	var nextPage= document.querySelector(".next-page");
	var pageCount= document.querySelector(".page-count");
	
	var startNum = 0;
	var currentPage = 1;
	var page = 12;
	

	
	input.addEventListener("input",()=>{
		
		invalidate(startNum, bc1, bc2, bc3, input.value);	
	});
	
	mt4.onclick = (e)=>{
		e.preventDefault();
		e.stopPropagation();
		
		if(e.target.classList.contains("c-icon-keyboard-arrow-down")){
			e.target.classList.replace("c-icon-keyboard-arrow-down","c-icon-keyboard-arrow-up");
			search(e,false);
		}else{
			e.target.classList.replace("c-icon-keyboard-arrow-up","c-icon-keyboard-arrow-down");
			search(e,true);
		}
		
		if(e.target.children[0])
			changeArrow(e)
		
//		console.log("boolean:" +bc1, bc2, bc3);
		invalidate(startNum, bc1, bc2, bc3, input.value)
	}
	
	pagerList.onclick=(e)=>{
		e.preventDefault();
		currentPage = parseInt( e.target.innerText);
		startNum = (currentPage -1) *  page ;
				
		invalidate(startNum, bc1, bc2);
		selectPage(currentPage);
//		console.log("PagerList====="+currentPage);		
	};                     
	
	prevPage.onclick=(e)=>{
		e.preventDefault();
		
		if((currentPage-1) < 1){
			alert('이전 페이지가 없습니다.')
			return;
		}	

		currentPage -= 1; 	
		startNum = (currentPage -1) *  page ;
	

		invalidate(startNum, bc1, bc2);		
		selectPage(currentPage);	
	};
	
	nextPage.onclick=(e)=>{
		e.preventDefault();
		

		if((currentPage+1) > pageCount){
			alert('다음 페이지가 없습니다.')
			return;			
		}

		currentPage += 1;
		startNum = (currentPage-1) *page;
			
		invalidate(startNum, bc1, bc2);		
		selectPage(currentPage);		
	}
	function selectPage(p){
		
		//선택된번호만 색 변하게 
		for(let i=0; i<pagerList.children.length; i++)
			pagerList.children[i].children[0].classList.remove("current");
			
		pagerList.children[p-1].children[0].classList.add("current");

	}
	
	function changeArrow(e){
		if(e.target.children[0].classList.contains("c-icon-keyboard-arrow-down")){
			e.target.children[0].classList.replace("c-icon-keyboard-arrow-down","c-icon-keyboard-arrow-up");
			search(e,false);
		}else{
			e.target.children[0].classList.replace("c-icon-keyboard-arrow-up","c-icon-keyboard-arrow-down");
			search(e,true);
		}
	}
	
	
	function search(e,b){
		if(e.target.classList.contains("regdate")){
			bc1 = b;
		}else if(e.target.classList.contains("notePub")){
			bc2 = b;
		}else if(e.target.classList.contains("bookPub")){
			bc3 = b;
		}
	}
	
	function invalidate(p, bc1, bc2){
		
		fetch(`/api/member/list?p=${p}&c1=${bc1}&c2=${bc2}&c3=${bc3}&name=${input.value}`)
			.then(response=>response.json())
			.then(json=>{
				let {cnt,list} = json;
				pageCount = 1;
	
				
				pagerList.innerHTML = "";
				memberList.innerHTML = "";
				
				//페이징없이 검색한 전체갯수  ??
				pageCount = parseInt(Math.ceil(cnt/page));
				console.log("pageCount"+pageCount);	 
			
				pl3.innerText = 0 +'/'+ cnt;
				if(list.length > 0){				
					pl3.innerText =list.length +'/'+ cnt;
					for(let i=0; i<4; i++){
						for(let j=0; j<3; j++){
							
							if(list[(i*3)+j]){
							
							let l = list[(i*3)+j];
							let d = new Date(l.regdate);
							let t= d.getFullYear() +"-"+ d.getMonth()+1  +"-"+ d.getDate()  +" "+ d.getHours() +":"+ d.getMinutes()+":"+ d.getSeconds()
							
							let div = `<div class="member">
								<div>
									<span><img src="/images/picture-empty.png"></span>
									<span>${l.name}(${l.nicname})</span>
									<span>${l.email}</span>
								</div>
								<div class="info">							
										<span>가입일 :   ${t}</span>
									</div>
								<div class="info">
									<span class="c-symbol c-symbol-note-color1">${l.notePubCnt}/${l.noteAllCnt}</span>
									<span class="c-symbol c-symbol-book-color1">${l.bookPubCnt}/${l.bookAllCnt}</span>
								</div>
							</div>
							`;
							memberList.insertAdjacentHTML("beforeend",div);
							}
						}
					}
					
					for(var i=0; i<pageCount; i++){		
						
						var li = `<li><a href="" class='${currentPage==(i+1) ? 'current' : ""}'> ${i+1} </a></li>`
						
						pagerList.insertAdjacentHTML("beforeend",li);
					}
				}
				if(list.length == 0){
						var li = `<li><a href="" class="current" > 1 </a></li>`
						
						pagerList.insertAdjacentHTML("beforeend",li);
				}
			});
		}
	
});