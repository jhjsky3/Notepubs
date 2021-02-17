window.addEventListener("load", function() {
	let main = document.querySelector(".main");
	let addButton = main.querySelector(".add-button");

	let regForm = main.querySelector(".reg-form");
	let cancelButton = regForm.querySelector(".c-btn-cancel");
	let regButton = regForm.querySelector(".btn-reg");
	let inputName = regForm.querySelector(".input-name");

	let categoryList = main.querySelector(".category-list");
	let delButton = categoryList.querySelectorAll(".del-button");
	let editButton = categoryList.querySelectorAll(".edit-button");
	
	let noneCategory = main.querySelector(".none-category");
	let toolButton = main.querySelector(".tool-button");
	


	function stateChange() {
		fetch(`/api/mycategory/list`)
		.then(response => response.json())
		.then(json => {
			
			if (json.length == 0)
				noneCategory.classList.remove("d-none");
			
			categoryList.innerHTML = "";

			for (let c of json) {
				let li = `<li>
					<span class="title">${c.name}</span>
					<span class="tool show-hover">
						<a data-id="${c.id}" class="c-btn c-btn-inline" href="">수정</a>
						<a data-id="${c.id}" class="c-btn c-btn-inline del-button" href="">삭제</a>
					</span>
				</li>`

				categoryList.insertAdjacentHTML("beforeend", li);
			}

		})
	};

	addButton.onclick = function(e) {
		e.preventDefault();
		regForm.classList.remove("d-none");
		console.log("add");
	};
	
	cancelButton.onclick = function(e) {
		e.preventDefault();
		regForm.classList.add("d-none");
	
		console.log("cancel");
	};

	regButton.onclick = function(e) {
		e.preventDefault();
	
		//noneCategory가 사라지지 않았다면 d-none.
		if (noneCategory != null)
			noneCategory.classList.add("d-none");
	
		let name = inputName.value;
	
		fetch(`/api/mycategory/reg`, {
			method: 'POST',
			headers: {
				//'Content-Type': 'application/json',
				'Content-Type': 'application/x-www-form-urlencoded',
			}
			, body: 'name=' + name
		})
		.then(response => response.json())
		.then(result => {
			if(result == 1)
				stateChange();
		})
	};

	categoryList.onclick = (e) => {
		e.preventDefault();
	
		console.log(e.target.dataset.id);
	
		let id = e.target.dataset.id;
	
		if(e.target.classList.contains("del-button")) {
			fetch(`/api/mycategory/${id}/delete`)
			.then(response => response.json())
			.then(result => {
				if(result == 1)
					stateChange();
			})
		}
		else if(e.target.classList.contains("edit-button")) {
           for(let i=0; i<categoryList.children.length; i++ ){
	             if(i%2 == 0){
		            categoryList.children[i].classList.remove("d-none") 
	           } else{
		            categoryList.children[i].classList.add("d-none")
               	}
            }

            let parentLi =e.target.parentElement.parentElement;
			parentLi.classList.add("d-none");	
		    
            parentLi.nextElementSibling.classList.remove("d-none");
             
		
		}
		
	};

});

