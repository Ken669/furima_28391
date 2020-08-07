'use strict';
setInterval(() => {
  const chargeForm = document.getElementById('charge-form');
  if(chargeForm){
    Payjp.setPublicKey('pk_test_0475934debda6602e5ac13f0');
    chargeForm.addEventListener('submit', (event)=>{
      event.preventDefault();

      const number = document.getElementById('card-number');
      const exp_month = document.getElementById('card-exp-month');
      const exp_year = document.getElementById('card-exp-year');
      const cvc = document.getElementById('card-cvc');

      const card = {
        number: number.value,
        exp_month: exp_month.value,
        exp_year: `20${exp_year.value}`,
        cvc: cvc.value,
      };
      // 
      Payjp.createToken(card, (status, res)=>{
        if(status === 200){
          const token = res.id;
          const tokenObj = `<input value="${token}" type="hidden" name="token">`;
          chargeForm.insertAdjacentHTML('beforeend', tokenObj);

          number.removeAttribute('name');
          exp_month.removeAttribute('name');
          exp_year.removeAttribute('name');
          cvc.removeAttribute('name');

          chargeForm.submit();
          chargeForm.reset();
        }
      });
    });
  }
}, 1000);