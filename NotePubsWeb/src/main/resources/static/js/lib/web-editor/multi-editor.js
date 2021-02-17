

/**
 * 1. iframe의 body 컨텐츠의 높이가 달라질 때 iframe의 높이를 같이 늘리게 하는 부분에서 꼼수를 사용하였다.
 *    - w3c에 의하면 2017년 권고안에는 모든 엘리먼트에 onresize 이벤트가 포함되었다고 함.
 *    - 이 부분이 모든 브라우저에 적용된다면 꼼수는 사라질 듯.
 *    - 현재는 onresize 이벤트를 사용할 수 없으므로 작성중인 콘텐츠가 달라지면 높이를 달라지게 설정하였음. 
 * 
 */

/*	window.addEventListener("beforeunload", function(event){
		alert("aa");
		event.preventDefault();
		
		for(var i=0; i<textAreas.length; i++){
			var textArea = textAreas[i];
			
			var edited = false;
			
			alert(textArea.value().length);
		}
	});*/

var modified = false;

window.onbeforeunload = function(e) {
		
	var dialogText = '변경사항 확인';
	
	if(modified){
		e.returnValue = dialogText;
		return dialogText;
	}
	
	//var textAreas = document.querySelectorAll(".textarea");
	//var edited = false;
	
	/*for(var i=0; i<textAreas.length; i++){
		var textArea = textAreas[i];
		
		console.log(textArea.value().length);		
	}*/
	
};

/*
 * 주의 : 이 스크립트 파일을 로드하는 페이지에서 var root 변수를 선언하고 context 값을 대입해야만 한다. 
 */

function WebEditor(selector, context){
		
	var textAreas = document.querySelectorAll(selector);	
	var submitButton = document.querySelector("input[type='submit']");
	
	submitButton.onclick = function(){		
		modified = false;
	};
	
	for(var i=0; i<textAreas.length; i++){
		
		(function(){
			var textArea = textAreas[i];
			
			var parentElement = textArea.parentElement;
			//var htmlEditor = document.createElement("div");
			var iframe = document.createElement("iframe");						
			parentElement.appendChild(iframe);			
			
			var win =iframe.contentWindow;
			var doc = win.document;
			var body = doc.body;
						
			// 텍스트 상자를 숨기고 그 자리에 같은 크기의 편집기를 추가하기
			//iframe.scrolling="no";
			iframe.style.boxSizing = "border-box";
			iframe.style.border="1px solid #e9e9e9";
		    //iframe.style.width = textArea.offsetWidth + "px";
			iframe.style.width = "100%";
			//iframe.style.minHeight = "200px";//textArea.offsetHeight + 100 + "px";
									
			textArea.style.display = "none";
			
			importCSS(context+"/resources/js/lib/web-editor/multi-editor.css", doc);
			
			body.style.padding = "0px";
			body.style.margin = "0px";
			/*body.style.height = "auto";
			body.style.overflow = "auto";*/
						
			/*var toolbar = document.createElement("div");
			body.appendChild(toolbar);
			toolbar.style.background = "red";*/			
			
			/*			
			// 텍스트 상자를 숨기고 그 자리에 같은 크기의 편집기를 추가하기
			htmlEditor.style.boxSizing = "border-box";
			htmlEditor.style.border="1px solid #e9e9e9";
		    //htmlEditor.style.width = textArea.offsetWidth + "px";
			htmlEditor.style.width = "100%";
		    htmlEditor.style.minHeight = textArea.offsetHeight + "px";
		    parentElement.appendChild(htmlEditor);
			textArea.style.display = "none";*/
			
			//편집기 영역에 편집기의 View를 담당하는 HTML 페이지를 로드한다.
		    var request = new XMLHttpRequest();
		    request.onload = function (e) {
		    	body.innerHTML = request.responseText;
		    	
		    	// HTML 문서가 로그되면 편집 영역 객체 얻기
		    	var toolbar = body.querySelector(".toolbar");
		    	var htmlArea = body.querySelector(".html-area");
		    	var optionBar = body.querySelector(".option-bar");
		    	var urlBox = optionBar.querySelector(".url-box");
		    	var fontSizeBox = optionBar.querySelector(".font-size-box");
		    	var fontColorBox = optionBar.querySelector(".font-color-box");
		    	
		    	var copyButton = toolbar.querySelector(".toolbar .btn-copy");
		    	var pasteButton = toolbar.querySelector(".toolbar .btn-paste");
		    	
		    	var boldButton = toolbar.querySelector(".toolbar .btn-bold");
		    	var underlineButton = toolbar.querySelector(".toolbar .btn-underline");
		    	var italicButton = toolbar.querySelector(".toolbar .btn-italic");
		    	
		    	var leftButton = toolbar.querySelector(".toolbar .btn-left");
		    	var centerButton = toolbar.querySelector(".toolbar .btn-center");
		    	var rightButton = toolbar.querySelector(".toolbar .btn-right");
		    	
		    	var fontSizeButton = toolbar.querySelector(".toolbar .btn-font-size");
		    	var fontColorButton = toolbar.querySelector(".toolbar .btn-font-color");
		    	
		    	var imageButton = toolbar.querySelector(".toolbar .btn-image");
		    	var linkButton = toolbar.querySelector(".toolbar .btn-link");
		    	/*var htmlButton = toolbar.querySelector("input[value='html']");*/
		    	
		    	// 파일 선택 버튼
		        var fileButton = toolbar.querySelector("input[type='file']");
		    	
		        var linkTextBox = optionBar.querySelector(".link-text");
		        var linkUrlBox = optionBar.querySelector(".link-url");
		        var addLinkButton = optionBar.querySelector(".btn-add-link");
		        
		        /*--- 초기화 -------------------------------------------------------------------*/
		        iframe.style.height = "300px";
		        iframe.scrolling = "no";
		        
		        //urlBox.style.display = "none";
		        //fontSizeBox.style.display = "none";
		        //fontColorBox.style.display = "none";
		        
		        doc.oncontextmenu = function(evt){
		        	evt.preventDefault();
		        	
		        	toolbar.style.left = evt.clientX+"px";
		        	
		        	console.log(evt.clientY+20);
		        	console.log(toolbar.offsetHeight);
		        	console.log(htmlArea.offsetHeight);
		        	
		        	var top = evt.clientY+20;
		        	
		        	// context 메뉴가 영역을 넘어서는 경우의 처리
		        	if(evt.clientY+20 + toolbar.offsetHeight > htmlArea.offsetHeight)
		        		top = htmlArea.offsetHeight - toolbar.offsetHeight;
		        		
		        	toolbar.style.top = top+"px";//evt.clientY+20+"px";
		        	toolbar.style.opacity = 1;
		        	
		        	urlBox.style.display = "none";
			        fontSizeBox.style.display = "none";
			        fontColorBox.style.display = "none";
		        };
		        
		        
		        htmlArea.addEventListener("click", function(){
		        	toolbar.style.opacity = 0;
		        	toolbar.style.left = "-900px";
		        	
/*		        	setTimeout(function(){
		        	}, 700);*/
		        });		        
		        
		        /*=== 파일 업로드 코드 ================================================================*/
		        var fileUpload = function(file){
		        	
		        	var formData = new FormData();
	    			formData.append("file", file);
	    			
	    			var xhr = new XMLHttpRequest(); // XML을 HTTP으로 요청을 보내고 응답을 받을 수 있는 도구
	    			
	    			xhr.onload = function(e) {
	    					    				
	                    var path = xhr.responseText; // uploaded file path and name,
	                    console.log(path);
	                    
	    				var img = document.createElement('img');
	    				img.src = path;
	    				img.style.maxWidth = "80%";
	    				img.style.maxHeight = "80%";
	    				img.style.border = "1px solid #e9e9e9";
	    				
	        			if (document.all) {
	        				var range = document.getSelection().createRange();
	        				range.pasteHTML(img);
	        				range.collapse(false);
	        				range.select();
	        			} else {
	        				doc.execCommand("insertHTML", false, '<img src="'+path+'" style="max-width:90%;max-height:90%;border:1px solid #e9e9e9;" />');
	        			}
	        			
	        			// 이미지가 포함된 후에 그 포함된 내용을 전송을 위한 textArea에 설정. 
	        			setTimeout(function() {
	        				textArea = htmlArea.parentElement.parentElement.parentElement.parentElement.previousElementSibling;
	        				console.log(textArea);
	    		            textArea.value = htmlArea.innerHTML;
	        			}, 200);
	    			};

	    			xhr.onerror = function(e) {
	    				alert("예기치 못한 오류가 발생하였습니다.");
	    			};
	    			xhr.open("POST",
	    					//"../../upload?"+csrfParameter+"="+csrfToken,
	    					"/author/upload",
	    					true); // 데이터를 요청하기 위한 설정 // 세번째 파라메터 -> 비동기(true) or 동기(false) 설정
	    			xhr.send(formData);
		        }
		        
		        // ==== 클립보드에 있는 캡쳐 이미지를 업로드하기 위한 코드 ====================================
		        htmlArea.addEventListener("paste", function (evt) {
					/*if(evt.clipboardData.items.length > 1){
						alert("하나 이상의 아이템은 붙여넣기를 할 수 없습니다.");
						return;
					}*/
					//alert("aa");
					var item = evt.clipboardData.items[0];
			        
			        if (item.type.indexOf("image") > -1) { // 클립보드 데이터가 아미지인 경우
			            var file = item.getAsFile();
			            fileUpload(file);
			        } else {
			            //alert("이미지 파일이 아닙니다.");
			        }
				});		             
		             	       
		        
		        // 기존 텍스트 상자에 있는 내용을 편집 모드로 가져온다.
		        htmlArea.innerHTML = textArea.value;
		        
		        htmlArea.onclick = function (evt) {	        
		        	console.log("htmlArea.onclick");
		            textArea.value = htmlArea.innerHTML;
		            modified = true; // 저장하지 않고 페이지를 벗어날 때 확인을 위한 부분
		            
		            iframe.style.height = htmlArea.offsetHeight + "px";
		            //console.log("onclick : " + htmlArea.offsetHeight + "px");
		        };
		        
		        htmlArea.onmouseup = function (evt) {
		        	console.log("htmlArea.onmouseup");
		            textArea.value = htmlArea.innerHTML;
		            modified = true; // 저장하지 않고 페이지를 벗어날 때 확인을 위한 부분
		            
		            //console.log("onmouseup : " + textArea.value);
		            
		            iframe.style.height = htmlArea.offsetHeight + "px";
		            //console.log("onmouseup : " + htmlArea.offsetHeight + "px");
		        };
		        
		        htmlArea.onkeyup = function (evt) {
		        	console.log("htmlArea.onkeyup");
		            textArea.value = htmlArea.innerHTML;
		            modified = true; // 저장하지 않고 페이지를 벗어날 때 확인을 위한 부분 
		            
		            //console.log("onkeyup : " + textArea.value);
		            
		            iframe.style.height = htmlArea.offsetHeight + "px";
		            //console.log("onkeyup : " + htmlArea.offsetHeight + "px");
		            
		        };
		        
		        setTimeout(function() {
		        	iframe.style.height = htmlArea.offsetHeight + "px";
		        }, 200);
		        /*=== button handlers ============================================================================*/
		        /*copyButton.onclick = function(){
		    		doc.execCommand('copy');
		    	};*/
		    	
		    	
		    	/*
		    	 * paste 기능은 user.js 설정 파일에서 클립보드가 활성화 되어 있어야 하는데 이 파일은 컴퓨터의 프로필 폴더 루트에 두어야 만 한다.
		    	 * 이 것은 현실적으로 의미가 없는 소루션임. 따라서 붙여넣기 기능은 모바일에서는 지원하지 않기로 함.
		    	 * 참고 사이트 :
		    	 * https://developer.mozilla.org/ko/docs/Web/API/Document/execCommand 
		    	 * http://kb.mozillazine.org/User.js_file 이 문서를 참고
		    	 */
		    	/*pasteButton.onclick = function(e1){
		    		doc.execCommand('paste');
		    		alert(e1.clipboardData);
		    		var item = evt.clipboardData.items[0];
			        
			        if (item.type.indexOf("image") > -1) { // 클립보드 데이터가 아미지인 경우
			            var file = item.getAsFile();
			            fileUpload(file);
			        } else {
			            //alert("이미지 파일이 아닙니다.");
			        }
		    	};*/
		        		        
		    	boldButton.onclick = function(){
		    		doc.execCommand('bold');    		
		    	};
		    	
		    	underlineButton.onclick = function(evt){
		    		doc.execCommand('underline');
		    		// 편집기에서 텍스트 선택이 해제되지 않게하는 비법??? ㅜㅜ
		        	evt.preventDefault();
		    	};
		    	
		    	italicButton.onclick = function(evt){
		    		// 편집기에서 텍스트 선택이 해제되지 않게하는 비법??? ㅜㅜ
		    		evt.preventDefault();

		    		doc.execCommand('italic');
		    	};
		    	/*----------------------------------------------------*/
		    	leftButton.onclick = function(evt){
		    		doc.execCommand('justifyLeft');
		    		// 편집기에서 텍스트 선택이 해제되지 않게하는 비법??? ㅜㅜ
		        	evt.preventDefault();
		    	};
		    	
		    	centerButton.onclick = function(evt){
		    		doc.execCommand('justifyCenter');
		    		// 편집기에서 텍스트 선택이 해제되지 않게하는 비법??? ㅜㅜ
		        	evt.preventDefault();
		    	};
		    	
		    	rightButton.onclick = function(evt){
		    		doc.execCommand('justifyRight');
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
		    		
		    		
		    		doc.execCommand('foreColor', false, color);
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
		    		
		    		doc.execCommand("fontSize", false, size);
		    		
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
		    	
		    	/*fontFamilyButton.onclick = function(evt){
		    		evt.preventDefault();
		    		doc.execCommand('justifyRight');
		    	};*/
		    	/*----------------------------------------------------*/
		    	imageButton.onclick = function(evt){
		    		    		
		    		// 1. 사용자가 업로드할 파일을 선택할 수 있도록
		    		var event = new MouseEvent("click", {
		    			'view' : window,
		    			'bubbles' : true,
		    			'cancelable' : true
		    		});
		    		
		    		fileButton.dispatchEvent(event);
		    		fileButton.onchange = function(){
		    			
		    			var file = fileButton.files[0];
		    			//var csrfParameter = doc.querySelector("meta[name='_csrf_parameter']").content;
		    			//var csrfToken = doc.querySelector("meta[name='_csrf']").content;
		    			
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
		    			
		    			var formData = new FormData();
		    			formData.append("file", file);
		    			
		    			var xhr = new XMLHttpRequest(); // XML을 HTTP으로 요청을 보내고 응답을 받을 수 있는 도구
		    			
		    			xhr.onload = function(e) {

		                    var path = xhr.responseText; // uploaded file path and name,
		                    console.log(path);
		                    
		    				var img = doc.createElement('img');
		    				img.src = path;
		    				img.style.maxWidth = "80%";
		    				img.style.maxHeight = "80%";
		    				//img.style.border = "1px solid #e9e9e9";
		    				img.style.boxShadow = "0 4px 15px 0 rgba(0, 0, 0, 0.15)";

		        			if (doc.all) {
		        				var range = doc.getSelection().createRange();
		        				range.pasteHTML(img);
		        				range.collapse(false);
		        				range.select();
		        			} else {
		        				doc.execCommand("insertHTML", false, '<img src="'+path+'" style="max-width:90%;max-height:90%;border:1px solid #595959;" />');
		        			}
		        			
		        			// 이미지가 포함된 후에 그 포함된 내용을 전송을 위한 textArea에 설정. 
		        			/*setTimeout(function() {        		
		        				//textArea = htmlArea.parentElement.parentElement.previousElementSibling;
		    		            textArea.value = htmlArea.innerHTML;
		        			}, 200);*/
		    			};

		    			xhr.onerror = function(e) {
		    				alert("예기치 못한 오류가 발생하였습니다.");
		    			};
		    			xhr.open("POST",
		    					//"../../upload?"+csrfParameter+"="+csrfToken,
		    					"/author/upload",
		    					true); // 데이터를 요청하기 위한 설정 // 세번째 파라메터 -> 비동기(true) or 동기(false) 설정
		    			xhr.send(formData);
		    			
		    			
		    			
		    		};

				};

				/*--- link handlers ---------------------------------------------------------------------------*/
		    		
				var urlFragment = null;
				var selection = {anchorNode:null, anchorOffset:null, focusNode:null, focusOffset:null};
				
		    	linkButton.onclick = function(){

					var sel = window.getSelection();
					alert(sel.anchorNode);					

					/*
					if(optionBar.classList.contains("hidden")){
		    			optionBar.classList.remove("hidden");
		    			
		    			fontColorBox.style.display = "none";
		    			fontSizeBox.style.display = "none";
		    			urlBox.style.display = "flex";
		    			
		    		}
		    		else{
		    			optionBar.classList.add("hidden");
		    			
		    			fontColorBox.style.display = "flex";
		    			fontSizeBox.style.display = "flex";
		    			urlBox.style.display = "none";
		    		}
		    		
					selection = {anchorNode:doc.getSelection().anchorNode, anchorOffset:doc.getSelection().anchorOffset, focusNode:doc.getSelection().focusNode, focusOffset:doc.getSelection().focusOffset};//.anchorNode;
					*/
		    	};
		    	
		    	addLinkButton.onclick = function(){
		    		/*
		    		var urlFragment = doc.getSelection().getRangeAt(0).cloneContents();
		    		if(urlFragment.childNodes.length==0){
		    			alert("링크를 걸기위한 텍스트를 선택하지 ")
		    		}*/
		    		
		    		if(doc.getSelection().anchorNode.nodeName=="DIV"){
		    			doc.getSelection().setBaseAndExtent(selection.anchorNode, selection.anchorOffset,selection.focusNode,selection.focusOffset);
		    		}
		    		
		    		//doc.getSelection().toString()
		    		
		    		var a = doc.createElement("a");
		    		a.href = linkUrlBox.value;
		    		a.textContent = linkTextBox.value;
		    		
		    		var container = doc.createElement("div");
		    		container.appendChild(doc.getSelection().getRangeAt(0).cloneContents());
		    		
		    		doc.execCommand("insertHTML", false, a.outerHTML);
		    		
		    		linkUrlBox.value = "";
		    		linkTextBox.value = "";
		    		
		    		optionBar.classList.add("hidden");
		    	};
		    	    	
		    	/*htmlButton.onclick = function(){
		    		doc.execCommand('justifyRight');
		    	};*/    	    
		        
		    	//htmlArea.focus();
		        
		    };

		    request.open("GET", context+"/resources/js/lib/web-editor/multi-editor.html");
		    request.send(null);
		})();	
	}
	


}


