window.addEventListener("load", (e)=>{

	let editor = document.querySelector(".editor");
	console.log(editor);
	let form = document.querySelector("#frm1");
	let htmlArea = editor.querySelector(".html-area");
	let textArea = editor.querySelector(".text-area");
	let boldButton = editor.querySelector(".btn-bold");
	let underlineButton = editor.querySelector(".btn-underline");
	let italicButton = editor.querySelector(".btn-italic");
	
	let leftButton = editor.querySelector(".btn-left");
	let centerButton = editor.querySelector(".btn-center");
	let rightButton = editor.querySelector(".btn-right");
	
	var fontSizeButton = editor.querySelector(".toolbar .btn-font-size");
	var fontColorButton = editor.querySelector(".toolbar .btn-font-color");
	
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
	underlineButton.onclick = function(e){
		e.preventDefault();
		document.execCommand('underline');
	};
	italicButton.onclick = function(e){		
		e.preventDefault();
		document.execCommand("italic");
	};
	/*----------------------------------------------------*/
	leftButton.onclick = function(evt){
		document.execCommand('justifyLeft');
		// 편집기에서 텍스트 선택이 해제되지 않게하는 비법??? ㅜㅜ
    	evt.preventDefault();
	};
	
	centerButton.onclick = function(evt){
		document.execCommand('justifyCenter');
		// 편집기에서 텍스트 선택이 해제되지 않게하는 비법??? ㅜㅜ
    	evt.preventDefault();
	};
	
	rightButton.onclick = function(evt){
		document.execCommand('justifyRight');
		// 편집기에서 텍스트 선택이 해제되지 않게하는 비법??? ㅜㅜ
    	evt.preventDefault();
	};
	
	/*--- font-color handlers -------------------------------------------------*/
	fontColorButton.onclick = function(evt){
		evt.preventDefault();
		if(optionBar.classList.contains("hidden")){
			optionBar.classList.remove("hidden");
			
			fontColorBox.style.display = "flex";
			fontSizeBox.style.display = "none";
			urlBox.style.display = "none";
		}
		else{
			optionBar.classList.add("hidden");
			
			fontColorBox.style.display = "none";
			fontSizeBox.style.display = "flex";
			urlBox.style.display = "flex";
		}
		
	};
	
	fontColorBox.onclick = function(evt){
		
		if(evt.target.nodeName != "INPUT"){
			return;
		}
		
		var color = "#979797";
		
		switch(evt.target.value){
		case "color-warning":
			color = "#ff0000";
			break;
		case "color-notice":
			color = "#dd8a00";
			break;
		case "color-highlight":
			color = "#709629";
			break;
		case "color-normal":
			color = "#979797";
			break;
		case "color-strong":
			color = "#000000";
			break;
		}
		
		
		document.execCommand('foreColor', false, color);
		/*var span = doc.createElement("span");
		span.textContent = doc.getSelection();
		span.style.color = color;
		
		console.log(span.outerHTML);
		doc.execCommand('insertHTML', false, span.outerHTML);*/
		
		optionBar.classList.add("hidden");
		fontColorBox.style.display = "none";
	};
	
	
	/*--- font-size handlers -------------------------------------------------*/
	fontSizeButton.onclick = function(evt){
		evt.preventDefault();
		
		if(optionBar.classList.contains("hidden")){
			optionBar.classList.remove("hidden");
			
			fontColorBox.style.display = "none";
			fontSizeBox.style.display = "flex";
			urlBox.style.display = "none";
		}
		else{
			optionBar.classList.add("hidden");
			
			fontColorBox.style.display = "flex";
			fontSizeBox.style.display = "none";
			urlBox.style.display = "flex";
		}
	};
	
	fontSizeBox.onclick = function(evt){
		
		if(evt.target.nodeName != "INPUT"){    			
			return;
		}
		
		var size = "1";
		
		if(evt.target.classList.contains("btn-size-sm")){
			size = "2";
		}
		else if(evt.target.classList.contains("btn-size-md")){
			size = "3";
		}
		else if(evt.target.classList.contains("btn-size-lg")){
			size = "4";
		}
		else if(evt.target.classList.contains("btn-size-xlg")){
			size = "5";
		}
		else if(evt.target.classList.contains("btn-size-xxlg")){
			size = "6";
		}
		else{
			alert("예기치 않은 오류가 발생하였습니다.");
			return;
		}
		
		document.execCommand("fontSize", false, size);
		
		/*var sel = doc.getSelection();
		alert(sel);
		var range = sel.getRangeAt(0);
		alert(range);*/
		
		/*var span = doc.createElement("span");
		span.innerHTML = doc.getSelection();
		span.style.fontSize = size;
		
		console.log(span.outerHTML);
		doc.execCommand('insertHTML', false, span.outerHTML);*/
		
		optionBar.classList.add("hidden");
		fontSizeBox.style.display = "none";
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

/*window.addEventListener("load", function(e){				
	header = document.querySelector(".header");
	toolbar = document.querySelector(".toolbar");
	editBody = document.querySelector(".body");
	htmlArea = document.querySelector(".html-area");
	
	var viewportHeaderOffset = header.getBoundingClientRect();
	var viewportToolbarOffset = toolbar.getBoundingClientRect();

	htmlArea.addEventListener("focus", function(e){
		window.scrollTo(0, -500);
		console.log("2");
	});

	window.addEventListener("scroll", function(e){
		
		// these are relative to the viewport, i.e. the window
		var headerTop = viewportHeaderOffset.top;
		var toolbarTop = viewportToolbarOffset.top;
		console.log(headerTop);
		if(headerTop < -66){
			toolbar.style.position = "fixed";
			toolbar.style.top = "0px";
		}
		else if(headerTop >= -66){
			toolbar.style.position = "static";
			//toolbar.style.top = "0px";
		}
	});			
});*/

