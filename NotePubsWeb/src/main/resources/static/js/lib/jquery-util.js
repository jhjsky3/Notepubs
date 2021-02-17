/**
 * 
 */
//=== hash 링크를 클릭하면 애니메이션으로 이동하도록 하기 위함 ============================
$('a[href^="#"]').click(function(event){
    $('html, body').animate({
        scrollTop: $($.attr(this, "href")).offset().top - 45
    }, 600);
    event.preventDefault();
});