window.addEventListener("load",(e)=>{
	
	let main = document.querySelector(".main");
	
	let langAddBtn = main.querySelector(".lang-add-button");
	let langRegForm = main.querySelector(".lang-reg-form");
	let langRegFormAddBtn = langRegForm.querySelector(".lang-reg-form-add-btn");
	let langRegFormCancelBtn = langRegForm.querySelector(".lang-reg-form-cancel-btn");
	
	
	let langAddForm = document.querySelector(".lang-add-form");
	let langAddFormRegBtn = langAddForm.querySelector(".lang-add-form-reg-btn");
	let langAddFormCancelBtn = langAddForm.querySelector(".lang-add-form-cancel-btn");
	
	let langList = document.querySelector(".lang-list");
	let langSelectBtn = langList.querySelector(".lang-select-btn");
	let langEditBtn = langList.querySelector(".lang-edit-btn");
	let langDeleteBtn = langList.querySelector(".lang-delete-btn");
	
	let inputLnag = langRegForm.querySelector(".lang-input");
	let idInput = langRegForm.querySelector(".id-input");
	let platList = main.querySelector(".plat-list");
	
	function setChange(){
		
		fetch(`/api/language/list`)
		.then(response => response.json())
		.then(json => {
			
			langList.innerHTML = "";

			for (let c of json) {
				let li = `
				<div class="content form-content lang-reg-form d-none">	
				<span class="text-align-right button-block">
					<a class="c-btn c-btn-inline lang-reg-form-add-btn" href="">등록</a>
					<a class="c-btn c-btn-inline c-btn-cancel lang-reg-form-cancel-btn" href="">취소</a>
				</span>
				</div>
				
				<div class="list-content content">
				<ul class="draggable-list lang-list">
					<li class="list-item">
					<span class="title">${c.name }</span>
					<span class="category">${c.categoryName}</span>
					<span class="tool show-hover">
						<a data-id="${c.id}" class="c-btn c-btn-inline lang-select-btn" href="">선택</a>
						<a data-id="${c.id}" class="c-btn c-btn-inline lang-edit-btn" href="">수정</a>
						<a data-id="${c.id}" class="c-btn c-btn-inline lang-delete-btn" href="">삭제</a>
					</span>
					</li>
					<li class="flow-content">					
						<span class=""><span>${c.name}</span><span class="c-icon c-icon-circle-del ml-1">삭제</span></span>
					</li>
				</ul>
				</div>
					`

				langList.insertAdjacentHTML("beforeend", li);
					}
			})
	}
	
	
	langAddBtn.onclick = (e) =>{ // 맨위 언어 추가 버튼
		
		e.preventDefault();
		console.log("langAddBtn");
		langRegForm.classList.remove("d-none");
	};
	
	langRegFormAddBtn.onclick = (e) =>{ // 언어 추가 후 등록버튼
		
		e.preventDefault();
		console.log("langRegFormAddBtn");
		
		let name = inputLnag.value;
		let categoryId = idInput.value;
		let platId = platList.value;
		
		console.log(name);
		console.log(categoryId);
		console.log(platId);
		fetch(`/api/language/reg`,{
			method:'POST',
			headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
         }
         , body: `name=${name}&categoryId=${categoryId}`
		})
			.then(response=> response.json())
			.then(result =>{
				console.log(result)
				if(result == 1 )
					setChange();
			})
	};
	
	
	langRegFormCancelBtn.onclick = (e) =>{ // 언어 추가 후 취소버튼
		
		e.preventDefault();
		console.log("langRegFormCancelBtn");
		langRegForm.classList.add("d-none");
	};
	
	langList.onclick = (e) =>{
		
		e.preventDefault();
			console.log(e.target.classList);
			console.log(e.target.dataset.id);
			let id = e.target.dataset.id
		
		if(e.target.classList.contains("lang-delete-btn")){
			console.log("langDeleteBtn");
			fetch(`/api/language/${id}/delete`)
			.then(response => response.json())
			.then(result => {
				if(result == 1)
					setChange();
			})
		}
		else if(e.target.classList.contains("lang-edit-btn")){
			console.log("langEditBtn");
			
			for(let i = 0; i < langList.children.length;i++){
				
				if(i % 1 == 0){
					langList.children[i].classList.remove("d-none");
					//langAddForm.classList.remove("d-none");
				} else{
					langList.children[i].classList.add("d-none");
				}
			}
	
			let parentLi = e.target.parentElement.parentElement;
			console.log(parentLi);
			parentLi.classList.add("d-none");	
			//langAddForm.classList.remove("d-none");
			
		}
		
		
	} // langRegList 끝
	
	langAddForm.onclick = (e) =>{
		
	
			

			console.log(e.target.classList);	
			
			
				
		}
	

	langDeleteBtn.onclick = (e) =>{ // 삭제버튼
		e.preventDefault();
		console.log("langDeleteBtn");
	};
	
	langAddFormRegBtn.onclick = (e) =>{ // 선택버튼 누른 후 등록버튼
		e.preventDefault();
		console.log("langAddFormRegBtn");
		
	};
	
	langAddFormCancelBtn.onclick = (e) => { // 선택버튼 누른 후 취소버튼
		e.preventDefault();
		console.log("langAddFormCancelBtn");
		langAddForm.classList.add("d-none");
		
	}
	
	
});


