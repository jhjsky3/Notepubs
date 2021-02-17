<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>
<script>
	window.addEventListener("load", function(){
		
		var ctx1 = document.querySelector("#viewChart");
		
		var data = {
	        labels: ['-6일', '-5일', '-4일', '-3일', '-2일', '-1일', '오늘'],
	        datasets: [
	            {
	                label: "조회수 변화",
	                fillColor: "rgba(220,220,220,0.2)",
	                strokeColor: "rgba(220,220,220,1)",
	                pointColor: "rgba(220,220,220,1)",
	                pointStrokeColor: "#fff",
	                pointHighlightFill: "#fff",
	                pointHighlightStroke: "rgba(220,220,220,1)",
	                data: [5764, 6785, 8976, 7002, 9108, 9012, 8313]
	            }
	        ]
	    };
		
		var lineChart = new Chart(ctx1, {
		    type: 'line',
		    data: data,
		    options: {}
		});
		
		var ctx2 = document.querySelector("#noteChart");
		
		var data = {
	        labels: ['-6일', '-5일', '-4일', '-3일', '-2일', '-1일', '오늘'],
	        datasets: [
	            {
	                label: "노트등록수 변화",
	                fillColor: "rgba(220,220,220,0.2)",
	                strokeColor: "rgba(220,220,220,1)",
	                pointColor: "rgba(220,220,220,1)",
	                pointStrokeColor: "#fff",
	                pointHighlightFill: "#fff",
	                pointHighlightStroke: "rgba(220,220,220,1)",
	                data: [23, 1, 3, 12, 21, 19, 5]
	            }
	        ]
	    };
		
		var lineChart = new Chart(ctx2, {
		    type: 'line',
		    data: data,
		    options: {}
		});
	});
</script>
        <main class="main">
            <section class="content-section first count-board">
                <h1 class="d-none">집계보드</h1>                
                <dl>
                    <dt>오늘 방문자</dt>
                    <dd>23</dd>
                    <dt>이번달 방문자</dt>
                    <dd>312</dd>           
                    <dt>오늘 노트 등록수</dt>
                    <dd>19</dd>
                    <dt>이번달 노트 등록수</dt>
                    <dd>532</dd>
                    <dt>7의 노트 등록수</dt>
                    <dd>102</dd>
                </dl>
            </section>
            <section class="content-section">
                <header>
                    <h1>7일간의 변동 추이</h1>
                </header>
                <div class="" style="display: flex;">
                	<div>
                    <canvas id="viewChart" style=""></canvas>
                    </div>
                    <div>
                    <canvas id="noteChart"></canvas>
                    </div>
                </div>
            </section>
            
            <section class="content-section">                
                <header>
                    <h1>노트 </h1>
                    <%-- <a href="" class="c-button c-write-button">자세히</a> --%>
                </header>        
                <div>
                
                </div>
            </section>
        </main>