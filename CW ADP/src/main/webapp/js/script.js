let navbar = document.querySelector('.header .header-2 .navbar');

document.querySelector('#menu-btn').onclick = () =>{
    navbar.classList.toggle('active');
    accountBox.classList.remove('active');
}



window.onscroll = () =>{
    navbar.classList.remove('active');
    


    if(window.scrollY > 60){
        document.querySelector('.header .header-2').classList.add('active');
    }
    else{
        document.querySelector('.header .header-2').classList.remove('active');
    }
}