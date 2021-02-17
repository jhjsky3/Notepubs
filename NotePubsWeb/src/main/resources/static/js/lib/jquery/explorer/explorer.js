/*
$(".expl").explorer({
	res:"../../resources/js/lib/notepubs",
	action:"../../files/newlec",
	home:"../../resources/home/newlec"
});*/

// 수정해야 할 버그 목록
/*
 * 1. 한 페이지에 여러개의 탐색기를 둘 경우에 doc.click 이벤틀가 여러 번 샐힝된다. 
 */

/*
 * example code
   $(".expl").explorer({
		res:"../../resources/js/lib/notepubs",
		action:"../../files/newlec",
		home:"/resources/home/newlec",
		mediaEncoder: "yes"
	});
 */

$.fn.explorer = function(setting){
	var res = setting.res;
	if(res.charAt(res.length-1) != "/")
		res += "/"; //추가하자
	
	var home = setting.home;
	
	// css 파일 가져오기
	// 1. link 태그를 생성하고
	// 2. link 속성에 css 파일 경로를 설정하고
	// 3. document.head 찾아서 append
	// <link href="${root}/resources/css/style.css" type="text/css" rel="stylesheet">
			
	var parent = this;
	
	var iframe = $("<iframe />")
		.css({
			border:"none",
			background:"yellow",
			width:"100%",
			height: "100%"
		})
		.appendTo(parent);
	var doc = iframe.contents();
	var body = doc.find("body");
	
	/*=== explorer ======================================================================*/
	//body에 html을 로드 하는 코드
	body.load(res+"explorer.html", function(){
		var head = doc.find("head");
		var style = $("<link />")
						.attr("href", res+"explorer.css")
						.attr("type", "text/css")
						.attr("rel", "stylesheet")
						.appendTo(head);
		
		/*var files = [
			{name:"test.txt", editDate:"2018-11-30 09:01", size:132, type:"file"},
			{name:"okay.html", editDate:"2018-12-23 23:33", size:34, type:"file"},
			{name:"haha.png", editDate:"2018-12-21 20:01", size:267, type:"file"},
			{name:"backup", editDate:"2018-12-21 20:01", size:0, type:"folder"}
		];*/
		
		// context menu : https://api.jquery.com/contextmenu/
		
		doc.click(function(ev){
			ev.stopPropagation();
			ev.preventDefault();
			
			var target = $(ev.target);
			if(!target.is("a"))
				return;
			
			if(target.data("isFile")){
				console.log("file");
				return;
			}
			
			ev.preventDefault();
			home += "/"+target.text();
			
			/*console.log("home:"+home);
			console.log("setting.home:"+setting.home);*/
			
			var locationDiv = body.find(".location");
			locationDiv.empty();
			
			$("<span />")
			.text(target.attr("href"))
			.appendTo(locationDiv);
			
/*			console.log("home:"+home);
			var locationString = home.substr(setting.home.length);
			
			var locationParts = locationString.split("/");
*/			/*var urls = [];
			for(var i=0; i<locationParts.length-1; i++){
				urls[i] = locationParts[i];
				console.log("urls:"+urls[i]);
				$("<a />")
				.attr("href", setting.home+"/"+locationParts[i])
				.text(locationParts[i])
				.appendTo(locationDiv);
			}*/
			
			refresh();
		});
		
		var refresh = function(){
			
			console.log(home);
			//console.log(setting.action+"?p="+home);
			$.getJSON(setting.action+"?p="+home, function(files){
				// http://localhost/web2018/files/newlec/aa/bb
				// http://localhost/web2018/files/newlec?path=/aa/bb
				
				// Trigger action when the contexmenu is about to be shown
				/*$(doc).on("contextmenu", function (event) {
				   	
				    event.preventDefault();
				    
				    // Show contextmenu
				    body.find(".context-menu").finish().toggle(100)//
				    
				    // In the right position (the mouse)
				    .css({
				        top: event.pageY + "px",
				        left: event.pageX + "px"
				    });
				});*/
				
				var tbody = body.find("tbody");
				tbody.empty();
							
				// 상위 경로를 위한 행과 링크를 추가하기
				var parent = home.substr(0, home.lastIndexOf("/"));
				var tr = $("<tr />")
							.appendTo(tbody);
				var td = $("<td />")
							.appendTo(tr);
				
				$("<a />")
				.attr("href", parent)
				.text("..")
				.appendTo(td);
				
				//--- file list adding ------------------------------------------------------------
				var rowTemplate = body.find("#row");
				
				for(var i=0; i<files.length; i++){
					var rowClone = $(document.importNode(rowTemplate[0].content, true));
					var tds = rowClone.find("td");
					var title = $("<a />")
									.attr("href", home+"/"+files[i].name)
									.attr("download", "download")
									.text(files[i].name)
									.data("isFile", files[i].isFile);
					
					tds.eq(0).append(title);
					tds.eq(1).text(files[i].editDate);
					tds.eq(2).text(files[i].size);
					tbody.append(rowClone);
				}
			});
		};
		
		refresh();
		
	});
	
	/*=== uploader ======================================================================*/
	var dropbox = doc[0];
	//-- status variables
	var dragover = false;
	var toolbar = $(".toolbar");
	
	var updateAlert = function(){
		if(dragover){
			toolbar.removeClass("hidden");
		}
		else
			toolbar.addClass("hidden");
	};
	
	dropbox.addEventListener("dragenter", function(event){
		event.stopPropagation();
		event.preventDefault();
		
		dragover = true;
		
		
		console.log("enter");
		updateAlert();
		
	},true);
	
	dropbox.addEventListener("dragleave", function(event){
		event.stopPropagation();
		event.preventDefault();
				
		dragover = false;
		console.log("leaver");
		updateAlert();
		
	},true);
	
	dropbox.addEventListener("dragover", function(event){
		console.log(event.target.nodeName);
		dragover = true;
		
		event.stopPropagation();
		event.preventDefault();
		
		console.log("over");
		
		var valid = event.dataTransfer
		&& event.dataTransfer.types 
		&& event.dataTransfer.types.indexOf("Files") >= 0 ;
		
		//$scope.dropboxText = event.dataTransfer.types;
		var dropboxText = valid ? "드롭하세요!" : "유효한 파일이 아닙니다.";
		console.log(dropboxText);
		//dropbox.style.background = "#ffff00";
		//dropboxClass = valid ? "valid" : "invalid";
				
		//dropbox.innerText = dropboxText;
	},true);
	
	dropbox.addEventListener("drop", function(event){
		console.log(event.target.nodeName);
		
		event.stopPropagation();
		event.preventDefault();
		
		console.log("drop");
	},true);
	
	
	
	
};