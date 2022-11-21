const bookBtn = document.querySelector('.bookmark-btt');
const section = document.querySelector('section');
const label = document.querySelector('label');

//클릭 시 사이드 메뉴 생성, 북마크 버튼 사라짐
bookBtn.addEventListener('click',function() {
    section.style.left = 0;
    label.style.opacity = 0;
})

//포커스 아웃 시 사이드 메뉴 사라짐, 북마크 버튼 생성
bookBtn.addEventListener('blur',function() {
    section.style.left = '-200px';
    label.style.opacity = 1;
})