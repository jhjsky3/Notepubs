window.addEventListener("load", (e)=>{

	let editor = document.querySelector(".editor");
	
	let form = document.querySelector("#frm1");
	let htmlArea = editor.querySelector(".html-area");
	let textArea = editor.querySelector(".text-area");
	let boldButton = editor.querySelector(".btn-bold");
	let italicButton = editor.querySelector(".btn-italic");
	let imgButton = editor.querySelector(".btn-image");
	let fileButton = editor.querySelector(".file-button");
	
	//https://developer.mozilla.org/en-US/docs/Web/API/Element/scrollIntoView
	/*	var element = document.getElementById("box");
	
	element.scrollIntoView();
	element.scrollIntoView(false);
	element.scrollIntoView({block: "end"});
	element.scrollIntoView({behavior: "smooth", block: "end", inline: "nearest"});*/
	
	let submitting = false;
	let edited = false;
	
	form.onsubmit = function(){
		submitting = true;
	};
	htmlArea.oninput = function(){
		textArea.value = htmlArea.innerHTML;
		edited = true;
		//console.log(textArea.value.length);
		//var elements = document.getElementById('content').getElementsByTagName('p');
		//elements[elements.length - 1].scrollIntoView();
		//window.scrollTo(0,document.body.scrollHeight+130);
		let element = document.activeElement;
		element.scrollIntoView({behavior: "smooth", block: "end", inline: "nearest"});
		
		
		//console.log(document.body.scrollHeight-130);
	};
	
	fileButton.oninput = function(e){
		//상자가 열리고 거기서 파일을 선택하면 상자가 닫힌다.
		// 그럼 현재 선택된 파일의 정보는 어떻게 되는가?
		var files = e.target.files;
		if(files.length > 1){
			alert("파일은 하나만 선택할 수 있습니다.");
			return;
		}


		var file = files[0];
		//for(var k in file)
			console.log(file.name + "," + file.type);
		
		//var regEx = new RegExp("image/(jpg|png|gif)");
		//console.log(file.type.match(regEx));
		/*if(file.size > 1024*1024*10){
			alert("너무 파일이 부담되요. 연료부족!!!");
			return;
		}*/
			
		// 아~ 이미지 파일을 하나를 선택했고 이제 그것을 업로드 해야겠다.
		var formData = new FormData();
		formData.append("file", file);	
		
		var xhr = new XMLHttpRequest();
		
		xhr.open("POST", `/member/upload`, true);
		//xhr.setRequestHeader("Content-Type", "multipart/form-data");
		xhr.upload.addEventListener("progress", function(e){
			console.log(Math.round(e.loaded*100/e.total)+"%");
		});
		xhr.onload = function(){
			// 선택 영역이라는 것이 있어야만 이미지가 그 위치를 알 수 있고
			// 그래야 삽입이 되는구나.
						
			htmlArea.focus();
			console.log(xhr.responseText);
			
			document.execCommand("insertHTML" ,
					false, 
					`<img src="${xhr.responseText}" >`);
			
		};
		xhr.send(formData);
	};
	imgButton.onclick = function(e){		
		e.preventDefault();		

		//fileButton의 onClick을 트리커하는 코드
		var event = new MouseEvent("click", {
	        'view': window,
	        'bubbles': true,
	        'cancelable': true
	    });
	    
		fileButton.dispatchEvent(event);
	};
	boldButton.onclick = function(e){
		
		e.preventDefault();
		document.execCommand("bold");
	};
	italicButton.onclick = function(e){		
		e.preventDefault();
		document.execCommand("italic");
	};
	
	//https://developer.mozilla.org/en-US/docs/Web/API/WindowEventHandlers/onbeforeunload
	window.addEventListener('beforeunload', function (e) {
		console.log("beforeunload");
	  // Cancel the event
	  e.preventDefault(); // If you prevent default behavior in Mozilla Firefox prompt will always be shown
	  // Chrome requires returnValue to be set
	  if(!submitting && textArea.value.length > 0 && edited)
		  e.returnValue = '';
	});
	
	window.addEventListener('beforeunload', function (e) {
	  // the absence of a returnValue property on the event will guarantee the browser unload happens
	  delete e['returnValue'];
	});
});
/*
window.addEventListener("load", (e)=>{
	let editor = document.querySelector(".editor");
	let saveBtn = editor.querySelector(".save-btn");
	let editorTitle = editor.querySelector(".editor-title");
	let htmlArea = editor.querySelector(".html-area");
	let noteId = editor.querySelector(".note-id"); //noteId 숨겨서 받아오기
	
	saveBtn.onclick=(e)=>{
		//e.preventDefault();
		console.log("editSaveBtn");
		
		console.log(noteId.value);	
		let id = noteId.value;
		let title = editorTitle.value;
		let content = htmlArea.innerText; //contenteditable 값 얻어오는 방법
		console.log(title);
		console.log(content);
		fetch(`/api/note/member/edit`,{
			 method: 'POST',
			headers: {
           'Content-Type': 'application/x-www-form-urlencoded',
        },body: `id=${id}&title=${title}&content=${content}`
		})
	};	
});
*/