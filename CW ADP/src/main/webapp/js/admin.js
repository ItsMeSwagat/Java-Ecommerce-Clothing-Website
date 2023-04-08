let navbar = document.querySelector('.header .navbar');
let accountBox = document.querySelector('.header .account-box');

document.querySelector('#menu-btn').onclick = () =>{
    navbar.classList.toggle('active');
    accountBox.classList.remove('active');
}

document.querySelector('#user-btn').onclick = () =>{
    accountBox.classList.toggle('active');
    navbar.classList.remove('active');
}

window.onscroll = () =>{
    navbar.classList.remove('active');
    accountBox.classList.remove('active');
}


/* to open the update products form */

/*const updateLink = document.querySelectorAll('.option-btn');

updateLink.addEventListener('click', (event) => {
  
  event.preventDefault();

  
  const editProductForm = document.querySelector('.edit-product-form');

  
  editProductForm.style.display = 'flex';
});

document.querySelector('#close-update').onclick = () => {
    document.querySelector('.edit-product-form').style.display = 'none';
}*/


/* End */

const showProducts = document.querySelector('.show-products');

// Add click event listener to the whole section and use event delegation to handle the button clicks
showProducts.addEventListener('click', (event) => {
  event.preventDefault();

  // Check if the clicked element has the "update-btn" class
  if (event.target.classList.contains('update-btn')) {
    const editProductForm = document.querySelector('.edit-product-form');
    editProductForm.style.display = 'flex';
    
    
  }

  // Check if the clicked element has the "delete-btn" class
  if (event.target.classList.contains('delete-btn')) {
    // Handle the delete operation here
  }
});

document.querySelector('#close-update').onclick = () => {
  document.querySelector('.edit-product-form').style.display = 'none';
};
