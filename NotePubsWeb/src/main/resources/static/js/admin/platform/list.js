window.addEventListener("load", (e)=>{
	const main = document.querySelector("main");
	const platformList = main.querySelector(".platform-list");
	const addButton = main.querySelector(".add-button");
	const platFormAddBtn = main.querySelector(".platform-add-btn");
	const platAddRegBtn = platFormAddBtn.querySelector(".plat-add-reg-btn");
	const platAddCancelBtn = platFormAddBtn.querySelector(".plat-add-cancel-btn")
	const platInput = platFormAddBtn.querySelector(".plat-input");
	const platIdInput = platFormAddBtn.querySelector(".plat-id-input");
	
	
	function setChange(){
		
		fetch(`/api/platform/list`)
		.then(response => response.json())
		.then(json => {
			
			platformList.innerHTML = "";

			for (let c of json) {
				let li = `
				
						<li class="list-item">
							<span class="title">${c.name}</span>
							<span class="category">${c.categoryName}</span>
							<span class="tool show-hover">
								<a data-id="${c.id}" class="c-btn c-btn-inline plat-edit-btn" href="">수정</a>
								<a data-id="${c.id}" class="c-btn c-btn-inline plat-delete-btn" href="">삭제</a>
							</span>
						</li>
					`
				platformList.insertAdjacentHTML("beforeend", li);
					}
			})
	}
	
	addButton.onclick = (e)=>{
		e.preventDefault();
		platFormAddBtn.classList.remove("d-none");
		
	};
	
	platAddRegBtn.onclick = (e)=>{
		e.preventDefault();
		console.log("platAddRegBtn");
		
		let name = platInput.value;
		let categoryId = platIdInput.value;
		
		fetch(`/api/platform/reg`,{
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
	}
	
	platformList.onclick = (e) =>{
		e.preventDefault();
		console.log(e.target.classList);
		console.log(e.target.dataset.id);
		let id = e.target.dataset.id
		
		if(e.target.classList.contains("plat-delete-btn")){
			console.log("platDeleteBtn");
			fetch(`/api/platform/${id}/delete`)
			.then(response => response.json())
			.then(result => {
				if(result == 1)
					setChange();
			})
		}
		
		else if(e.target.classList.contains("plat-edit-btn")){
			console.log("platEditBtn");
		}
		
	}
	
	
	
	platAddCancelBtn.onclick = (e)=>{
		e.preventDefault();
		platFormAddBtn.classList.add("d-none");
		console.log("platAddCancelBtn");
		
	}
	
	
	
});