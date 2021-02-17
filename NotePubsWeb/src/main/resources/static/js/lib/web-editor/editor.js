window.addEventListener("load", function(e) {
	var noteDiv = document.querySelector(".newlecture.note");
	noteDiv.addEventListener("click", noteDivClick);
	
	var editTool = document.querySelector(".newlecture.note .edit-tool");
	var nextArea = noteDiv.querySelector(".next-area");	
	
	var createTool = document.querySelector(".newlecture.note .create-tool");
	createTool.addEventListener("click", createToolClick);
	
	var editTool = document.querySelector(".newlecture.note .edit-tool");
	editTool.addEventListener("click", editToolClick);

	/*var hButton = document.querySelector(".newlecture.note .btn-h");
	var imgButton = document.querySelector(".newlecture.note .btn-img");
	var pButton = document.querySelector(".newlecture.note .btn-p");*/
	
	/*var editButton = document.querySelector(".newlecture.note .btn-edit");
	var delButton = document.querySelector(".newlecture.note .btn-del");
	var leftButton = document.querySelector(".newlecture.note .btn-left");
	var rightButton = document.querySelector(".newlecture.note .btn-right");
	var upButton = document.querySelector(".newlecture.note .btn-up");
	var downButton = document.querySelector(".newlecture.note .btn-down");*/
	
	// 상태 변수들
	var curElement = null;
	
	//--- 선택 리셋 액션들 -------------------------------------------------------------
	/* 
	 *  문서의 여백을 클릭했을 때 노트 요소들을 모두 선택 해제 하기 위한 코드.
	 * 	 버블링 과정보다 앞서서 처리하기 위해서 캡처링 옵션을 사용함. 
	 * */
	document.body.addEventListener("click", function(e){
		 var divs = noteDiv.querySelectorAll(".textarea");
		 for(var i=0; i<divs.length; i++){			 
			
			 if(curElement == divs[i] && curElement.contentEditable == "true"){
				 divs[i].style.border = '1px dashed orange';
				 continue;
			 }
				 
			 divs[i].style.border="none";
			 divs[i].contentEditable = false;
			 editTool.style.display = "none";
		 	
		 }
	}, true);

	
	//--- note Div 이벤트 처리 ------------------------------------------------------------------------
	function noteDivClick(e){
				
		e.stopPropagation();		
		
		var noteItem = e.target;
		
		// 현재 선택된 아이템 찾기
		if(!noteItem.classList.contains("textarea"))
			noteItem = noteItem.parentElement;
		
		// textarea를 찾지 못한 경우
		//if(!noteitem.classList.contains("textarea"))
		//	curElement = null;
	
		// 현재 아이템을 선택된 아이템으로 설정
		curElement = noteItem;
						
		// 현재 아이템을 제외한 다른 아이템들을 모두 읽기 모드로 변경.
		// Change all items except the current item to read mode.
		var divs = noteDiv.querySelectorAll(".textarea");
		 for(var i=0; i<divs.length; i++){			 
			
			 if(curElement == divs[i]){
				 divs[i].style.border = '1px dashed orange';
				 continue;
			 }
				 
			 divs[i].style.border="none";
			 divs[i].contentEditable = false;			 
		 	
		 }
		
		// 현재 아이템이 편집 모드가 아닐 경우 편집 도구 표시		
		if(noteItem.contentEditable=="false"){
			editTool.style.display = "block";
			editTool.style.top = noteItem.offsetTop+"px";
		}
		
		
		/*if(!e.target.classList.contains("textarea"))
			return;
		
		
		
		if (div.contentEditable) {
			div.style.border = '1px dashed orange';
			
		
			
			var top = e.target.offsetTop;
			
			if(!e.target.classList.contains("textarea"))
				top = e.target.parentElement.offsetTop;
			
			editTool.style.top = e.currentTarget.offsetTop+"px";
		}*/
			
	}
	
	//--- create tool 이벤트 처리 --------------------------------------------------------------------------
	function createToolClick(e){
		//노드 추가 : <div contentEditable="true" class="textarea margin-top"></div>	

		// 부모로 이벤트가 전파되지 않도록 한다.
		// Prevent the event from propagating to the parent.
		e.stopPropagation();
		
		// 버튼일 경우로 한정한다.
		// limited to buttons
		if(e.target.nodeName != "INPUT")
			return;
		
		// 새로운 아이템을 생성한다.
		// create a new item
		var div = document.createElement("div");
		div.contentEditable = true;
		div.style.position = "relative";
		div.classList.add("textarea");
				
		// 아이템의 종류별로 추가적인 속성을 설정한다.
		// Set additional properties for each item type.
		if(e.target.classList.contains("btn-p")){
			div.classList.add("p");
		}
		
		if(e.target.classList.contains("btn-h")){
			div.classList.add("title");
			div.classList.add("h1");
		}
		
		/*
		div.addEventListener("blur", function(e) {
			div.contentEditable = false;
			div.style.border = "none";
		});*/

		// 새로 만든 아이템을 문서에 추가한다.
		// Add the newly created item to the document.
		noteDiv.insertBefore(div, nextArea);
		
		// 새로 만든 아이템을 현재 엘리먼트로 설정한다.
		// Set the newly created item to the current element. 
		curElement = div;			
		
		// 현재 선택 엘리먼트를 표시한다.
		// Highlight the currently selected element.
		var divs = noteDiv.querySelectorAll(".textarea");
		 for(var i=0; i<divs.length; i++){
			
			 if(curElement == divs[i] && curElement.contentEditable == "true"){
				 divs[i].style.border = '1px dashed orange';
				 continue;
			 }
				 
			 divs[i].style.border="none";
			 divs[i].contentEditable = false;
		 	
		 }
		
		// 현재 추가된 엘리먼트에 포커스를 설정한다.
		 // Set focus to the currently added element.
		div.focus();
		
		

	}
		
	//--- edit tool 이벤트 처리  -------------------------------------------------------------
	function editToolClick(e){	
		e.stopPropagation();
		
		curElement.style.border="1px dashed #ff00ff";
		curElement.contentEditable = true;
		curElement.focus();
	}	
});






