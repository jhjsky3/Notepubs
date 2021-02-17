
window.addEventListener("load", function(){
	var section = document.querySelector(".language-category-content");
	var categoryList = section.querySelector(".category-list");
	var addButton = section.querySelector(".lang-add-button");
	
	
	addButton.onclick = function(e){
		e.preventDefault();
		
		var li = `<li class="edit new">
						<span class="title engName">
							<input type="text" name="engName" value="">
						</span>
						<select name="type" class="type">
							<option>형식</option>
							<option value="절차">절차 형식</option>
							<option value="구조">구조 형식</option>
						</select>
						<span class="tool">
							<a class="c-btn c-btn-inline reg-button" href="">저장</a>
							<a class="c-btn c-btn-gray cancel-button" href="">취소</a>
						</span>
					</li>`;

		categoryList.insertAdjacentHTML("afterbegin", li);
		
				
		setTimeout(() => {
		categoryList.firstElementChild.classList.remove("new");	
		
		}, 100);
	};
	
	section.onclick = function(e){
	
		if(e.target.classList.contains("cancel-button")){
			var li = e.target.parentElement.parentElement;
			li.remove();
		}
		else if(e.target.classList.contains("reg-button")){
			e.preventDefault();
			var li = e.target.parentElement.parentElement;
			var engName = li.querySelector(".engName input").value;
			var type = li.querySelector(".type").value;
			
			var xhr = new XMLHttpRequest();
			
			xhr.open("POST", "reg", true);			
			xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			xhr.onload = function(){
				console.log(xhr.responseText);
				var lang = JSON.parse(xhr.responseText);
				console.log(lang);
												
				li.remove();
				
				categoryList.insertAdjacentHTML("afterbegin", 
						`<li>
							<span class="title">${lang.engName}</span>
							<span>${lang.type} 형식</span>
							<span class="tool">
								<a class="c-btn c-btn-inline" href="">수정</a>
								<a class="c-btn c-btn-inline" href="del?id=${lang.id}">삭제</a>
							</span>
						</li>`);
				
			};
			xhr.send(`engName=${engName}&type=${type}`);		
		}
	};
	
	
});