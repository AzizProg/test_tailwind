const nav =document.getElementById('nav');
const open=document.getElementById('open');
const close=document.getElementById('close');

open.addEventListener('click', function(){
    nav.classList.add('inset-0');
}
)
close.addEventListener('click',function(){
    nav.classList.remove('inset-0');
})