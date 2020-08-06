'use strict';
setInterval(() => {
  const currentPath = window.location.pathname;
  if(currentPath === '/items/new' || currentPath === '/items'){
    const price = document.getElementById('item-price');
    const tax = document.getElementById('add-tax-price');
    const profit = document.getElementById('profit');
    const taxRatio = 0.1;
  
    price.addEventListener('keyup', ()=>{
      if (price.value < 300) {
        tax.textContent = 0;
        profit.textContent = 0;
      } else {
        tax.textContent = price.value * taxRatio;
        profit.textContent = price.value * (1 - taxRatio);
      }
    });
  }
}, 1000);    

