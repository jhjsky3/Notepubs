<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <main>
      <form action="edit" method="post">
         <div class="margin-top first">
            <h3 class="hidden">공지사항 수정</h3>
            <table class="table">
               <tbody>
               
                  <tr>
                     <th>작성자</th>
                     <td class="text-align-left text-indent text-strong text-orange" colspan="3">
                        <input type="text" name="uid"  value="${n.uid}" />
                     </td>
                  </tr>
                  <tr>
                     <th>제목</th>
                     <td class="text-align-left text-indent" colspan="3">
                     <input type="text" name="title" value="${n.title}"/>
                     </td>
                  </tr>
                  
                   <tr>
                     <th>공지사항</th>
                     <td class="text-align-left text-indent" colspan="3">
                     <input type="text" name="content" value="${n.content}"/>
                     </td>
                  </tr>
                  
                  <tr>
                     <th>조회수</th>
                     <td class="text-align-left text-indent" colspan="3">
                     <input type="text" name="hit" value="${n.hit}"/>
                     </td>
                  </tr>
              
               </tbody>
            </table>
         </div>
         
         <div class="margin-top text-align-center">
            <input type="hidden" name="id" value="${n.id}" />
            <input class="btn-text btn-default" type="submit" value="저장" />
            <a href="../notice/detail?id=${n.id}">취소</a>            
         </div>
      </form>
         
         
   </main>