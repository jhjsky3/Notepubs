/**
 * 
 */
window.addEventListener("load", function(){
	var bookSection = document.querySelector(".book-content-section");
	var bookList = bookSection.querySelector(".book-list");
	var addButton = bookSection.querySelector(".book-add-button");
	
	var offsetX = 0;
	bookSection.addEventListener("wheel", function(e){
		var e = window.event || e; // old IE support
	    var delta = Math.max(-1, Math.min(1, (e.wheelDelta || -e.detail)));
	    
	    offsetX += delta;
	    
	    if(offsetX > 0)
	    	offsetX = 0;
	    
	    bookList.style.transform = `translateX(${offsetX*30}px)`;
	});
	
	
	addButton.onclick = function(e){		
		e.preventDefault();
						
		if(bookList.firstElementChild.classList.contains("new-one")){
			alert("현재 등록을 위한 책이 작성중에 있습니다.\r\n마무리한 후에 추가할 수 있습니다.");
			return;
		}
		
		bookList.style.transform = `translateX(0px)`;
		
		var li = `<section class="book new-bf">
					<h1><input type="text" name="title" placeholder="책 제목을 입력하세요" ></h1>
					<form>
						<div class="img">
							<a href="detail?id=">
								<img class="img-button" src="/images/book/book-empty.png">
								<input class="file-button d-none" type="file" name="file">
							</a>
						</div>
						<div class="detail">
							<dl class="info">
								<dt class="note">노트 :</dt>
								<dd>0개</dd>
								<dt class="note">챕터 :</dt>
								<dd>0개</dd>
								<dt class="note">등록일 :</dt>
								<dd></dd>
								<dt class="note">수정일 :</dt>
								<dd></dd>
							</dl>
							<div>
								<a href="" class="c-btn c-btn-primary reg-button">등록</a>
								<a href="" class="c-btn c-btn-gray cancel-button">취소</a>
							</div>
						</div>
						<div class="analize d-none">
							<span class="note">320 조회수</span> <span class="chapter">6
								구독자</span> <span class="a">aaa</span> <span class="button c-symbol">버튼</span>
						</div>
					</form>
				</section>`;
		
		bookList.insertAdjacentHTML("afterbegin", li);		
		
		setTimeout(() => {
			newLi = bookList.firstElementChild; 
			newLi.classList.remove("new-bf");
			newLi.classList.add("new-one");
			var imgButton = newLi.querySelector(".img-button");
			var fileButton = newLi.querySelector(".file-button");
			var titleInput = newLi.querySelector('input[type="title"]');
			var regButton = newLi.querySelector(".reg-button");
			var cancelButton = newLi.querySelector(".cancel-button");
			var photoFile = null;
			
			fileButton.oninput = function(e){
				var countSelected = e.target.files.length;
				if(countSelected == 0){
					alert("파일을 선택해주세요.");
					return;
				}
				
				var file = e.target.files[0];
				
				var size = file.size;
				if(size > 10*1024*1024){
					alert("죄송합니다. 10MB를 넘는 파일은 전송할 수 없습니다.");
					return;
				}
				
				// 파일의 MIME 형식이 "image/"로 시작되지 않으면 오류 출력
				if(file.type.indexOf("image/") != 0){
					alert("이미지 형식이 아닙니다.");
					return;
				}
				
				/* ============================================ */
				var reader = new FileReader();
		        reader.onload = function (evt) {
		        	imgButton.src = evt.target.result;
		        }
				//--- 로컬파일 읽기 요청-------------------------
		        reader.readAsDataURL(file);
		        photoFile = file;
				/* ============================================ */
			};
			
			imgButton.onclick = function(e){
				e.preventDefault();
				
				var event = new MouseEvent("click", {
			        'view': window,
			        'bubbles': true,
			        'cancelable': true
			    });
			
				fileButton.dispatchEvent(event);
			};
			
			regButton.onclick = function(){
				var formData = new FormData();
				formData.append("title", titleInput.value);
				formData.append("img", photoFile);
				
				var xhr = new XMLHttpRequest();
				
				xhr.open("POST", "/member/book/reg", true);
//				xhr.upload.addEventListener("progress", function(e){
//					console.log(Math.round(e.loaded*100/e.total)+"%");
//				});
				xhr.onload = function(){					
					var json = xhr.responseText;
					console.log(json);
				};
				xhr.send(formData);	
				
				
			};
			cancelButton.onclick = function(){
				newLi.classList.add("new-bf");
				newLi.addEventListener("transitionend", function(){
					newLi.remove();						
				});
			};
			
		}, 100);
		
	};
	
	
});