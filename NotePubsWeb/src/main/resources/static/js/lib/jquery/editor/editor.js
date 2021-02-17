$.fn.editable = function(setting){
	var res = setting.res;
	if(res.charAt(res.length-1) != "/")
		res += "/"; //추가하자
	
	// css 파일 가져오기
	// 1. link 태그를 생성하고	
	// 2. link 속성에 css 파일 경로를 설정하고	
	// 3. document.head 찾아서 append
	// <link href="${root}/resources/css/style.css" type="text/css" rel="stylesheet">
	var style = $("<link />")
					.attr("href", res+"editor.css")
					.attr("type", "text/css")
					.attr("rel", "stylesheet")
					.appendTo("head");
	
	var textarea = this;
	var parent = textarea.parent();
		
	// 1. editarea를 생성 그것을 parent 붙이기
	var editarea = $("<div/>")
						.appendTo(parent);
	
	// 2. textarea의 크기, 스타일 등을 그대로 옮기기
	editarea.css({
		width: textarea.outerWidth(),
		minHeight: textarea.outerHeight(),
		border: textarea.css("border")
	});
	
	// 3. textarea를 숨긴다.
	textarea.css({
		display:"none"
	});
	
	// 4. 에디터를 위한 html 파일을 ajax 기능을 이용해서 load
	// ajax / get / getJSON / getScript / post ... / load
				
	editarea.load(res+"editor.html", function(){
		// iframe의 body 객체에 contenteditable=true를 설정
		var iframe = editarea.find(".com-notepubs-editor-panel-iframe");
		var doc = iframe.contents();
		
		var toolbar = editarea.find(".com-notepubs-editor-toolbar")
		/*var boldButton = toolbar.find("input[value='bold']");
		var italicButton = toolbar.find("input[value='italic']");
		var underlineButton = toolbar.find("input[value='underline']");*/
 		
		doc.find("body").attr("contenteditable", true);
		
		toolbar.click(function(e){			
			var target = $(e.target); 
			if(!target.is("input"))
				return;	
						
			/*if(?){
				
			}
			else if(){
				
			}
			else*/
				doc[0].execCommand(target.val());
			alert(doc[0].body.innerHTML);
			
		});
		
	});
	
	
	
};