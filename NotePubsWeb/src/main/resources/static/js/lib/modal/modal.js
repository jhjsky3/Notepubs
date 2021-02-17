/*
"messaeg", "type"
또는 
{
	type:"message", // message | wait | content | input	
	url:"/notice/partial/list",
	message:"hello",
	title:"안내메시지"	
}
*/

var CSS = {};
CSS.set = function(element, attrs){
	for(var key in attrs)
		element.style[key] = attrs[key];
}

function Modal(selector) {	
	// 속성들 ====================================
	this.screen = null;
	this.dialog = null;
	this.placeHolder = null;
	this.buttonType = "ok";
	this.dom = null	
	this.title = "관리메뉴";	
	
	// 초기 설정 ====================================	
	if(typeof selector == "string")
		this.dom = document.querySelector(selector);	
	else
		this.dom = selector;	
	
	this.okButtonCallback = null;
	this.cancelButtonCallback = null;
};

Modal.prototype = {
	createScreen: function(){
		var screen = document.createElement("div");
		CSS.set(screen, {
			width:"100%",
			height:"100%",
			position:"fixed",
			top:"0px",
			left:"0px",
			background:"rgba(0,0,0,0.3)",
			opacity:"0",
			transition:"500ms opacity"
		});
		
		screen.onclick = (e)=>{
			
			if(this.isOutside(e.target, this.dialog))
				this.hide();
			
		};
		
		this.screen = screen;
	},
	createDialog: function(){
		var dialog = document.createElement("div");
		CSS.set(dialog, {
			display:"flex",
			flexDirection:"column",
			minWidth:"300px",
			maxWidth:"90%",
			minHeight:"100px",
			position:"fixed",
			top:"50%",
			left:"50%",
			transform:"translate(-50%, -100%)",
			background:"#fff",
			boxShadow:"0 0 20px rgba(0,0,0,0.3)",
			borderRadius:"10px",
			transition:"500ms transform",
			padding:"10px"
		});
		
		var titleBox = document.createElement("div");
		titleBox.innerText = this.title;
		titleBox.classList.add("title-box");
		CSS.set(titleBox, {
			display:"flex",
			alignItems:"center",
			textIndent:"10px",
			color:"#333333",
			borderButtom:"#797979",
			borderTopLeftRadius:"10px",
			height:"18px",
		    lineHeight: "18px",
		    padding: "10px",
	    	borderBottom: "1px solid #e5e5e5",
	    	fontSize:"14px",
	    	fontWeight:"bold",
	        overflow: "hidden",
		    whiteSpace: "nowrap",
		    textOverflow: "ellipsis"
		});
		
		var contentBox = document.createElement("div");
		contentBox.classList.add("content-box");
		CSS.set(contentBox, {
			flexGrow:1,
			background:"#ffffff",
			boxSizing: "border-box",
			fontSize:"14px"
		});
		
		var buttonBox = document.createElement("div");
		buttonBox.classList.add("button-box");
		CSS.set(buttonBox, {
			//height:"50px",
			background:"#fefff8",
			borderTop:"#fefff8",
			textAlign:"center",
			marginTop:"10px"
		});
		
		var okButton = document.createElement("input");
		okButton.classList.add("ok-button");
		
		CSS.set(okButton, {
			cursor:"pointer",
			color:"#fff",
	    	backgroundColor: "#007bff",
	    	borderColor: "#007bff",
	    	fontWeight: "400",
	    	textAlign: "center",
	    	verticalAlign: "middle",
	    	border: "1px solid transparent",
	    	padding: ".375rem .75rem",
	    	fontSize: "1rem",
	    	lineHeight: "1.5",
	    	borderRadius: ".25rem",
			font: "400 13.3333px Arial",
			display:"none"
		});
						
		if(this.buttonType.indexOf("ok") >= 0)
			okButton.style.display = "inline-block";
		
		okButton.type="button";
		okButton.value="OK";
		okButton.onclick = this.okButtonClickHandler.bind(this);		
		
		var cancelButton = document.createElement("input");
		cancelButton.classList.add("cancel-button");
		CSS.set(cancelButton, {
			cursor:"pointer",
			marginLeft:"5px",
			color:"#fff",
			backgroundColor: "#6c757d",
		    borderColor: "#6c757d",
	    	fontWeight: "400",
	    	textAlign: "center",
	    	verticalAlign: "middle",
	    	border: "1px solid transparent",
	    	padding: ".375rem .75rem",
	    	fontSize: "1rem",
	    	lineHeight: "1.5",
	    	borderRadius: ".25rem",
			font: "400 13.3333px Arial",
			display:"none"
		});
		
		if(this.buttonType.indexOf("cancel") >= 0)
			cancelButton.style.display = "inline-block";
		
		cancelButton.type="button";
		cancelButton.value="Cancel";
		cancelButton.onclick = this.cancelButtonClickHandler.bind(this);
				
		var closeButton = document.createElement("input");
		closeButton.type="button";
		closeButton.value="X";
		closeButton.onclick = this.closeButtonClickHandler.bind(this);
		CSS.set(closeButton, {
			position:"absolute",
			right:"-20px",
			top:"-20px",
			fontSize:"20px",
			width:"40px",
			height:"40px",
			border:"none",
			borderRadius:"20px",
			background:"#000000",
			color:"#ffffff",
			display:"flex",
			alignItems:"center",
			justifyContent:"center",
			fontWeight:"bold",
			cursor:"pointer"
		});
		
		//buttonBox.append(okButton);
		//buttonBox.append(cancelButton);
		//dialog.appendChild(closeButton);
		
		dialog.appendChild(titleBox);
		dialog.appendChild(contentBox);
		dialog.appendChild(buttonBox);		
		
		this.dialog = dialog;
	},
		
	createMessageDialog : function() {
		this.createDialog();
		var contentBox = this.dialog.querySelector(".content-box");
		
		contentBox.append(this.dom);
		CSS.set(contentBox, {
			padding:"10px",
			textAlign:"center",
		    borderBottom: "1px solid rgb(229, 229, 229)"
		});
		
	},
	show : function() {		
		
		this.createScreen();				
		this.createMessageDialog();						
		
		document.body.appendChild(this.screen);		
		this.screen.addEventListener('transitionend', () => {
			document.body.appendChild(this.dialog);
			
			var dialog = this.dialog;
			setTimeout(function(){
				dialog.style.transform="translate(-50%, -50%)";
			},10);
			
		});
		
		var screen = this.screen;
		setTimeout(function(){
			screen.style.opacity = "1";			
		},10);
		
		this.dom.classList.remove("d-none");
				
	},
	hide:function(e){
		if(this.screen){
			this.screen.remove();
			this.screen = null;
		}
		if(this.dialog){
			this.dialog.remove();
			this.dialog = null;
		}
		this.dom.classList.add("d-none");
	},
	closeButtonClickHandler : function(e) {				
		this.hide();
	},
	okButtonClickHandler : function(e) {		
		var inputText = "";		
		if(this.type == "input")
			inputText = this.getInputText();
		
		if(this.okButtonCallback != null)
			this.okButtonCallback(inputText);
		
		this.hide();
	},	
	cancelButtonClickHandler : function(e) {
		var inputText = "";		
		if(this.type == "input")
			inputText = this.getInputText();
		
		if(this.cancelButtonCallback != null)
			this.cancelButtonCallback(this.getInputText());
		
		this.hide();
	},
	addEventListener:function(eventName, callback){	
		
		switch(eventName){
		case "ok":
			this.okButtonCallback = callback;		
			break;
		case "cancel":
			this.cancelButtonCallback = callback;			
			break;
		}
		
		return this;
	
	},
	isInside:function(target, element){
    
        var currentElement = target;
        do{
        	
            if(currentElement == element){
                console.log("inside");
                return true;
            }
            
            currentElement = currentElement.parentElement;
        
        }while(currentElement);

        return false;
	},
	isOutside:function(target, element){
	    return !this.isInside(target, element);
	},
	getInputText:function(){
		if(this.type != "input"){
			alert("입력 대화상자일 때만 사용이 가능한 메소드입니다.");
			return;
		}
		var contentBox = this.dialog.querySelector(".content-box");
		var inputElement = this.dialog.querySelector(".input-element");
		return inputElement.value;
		
	}
};



