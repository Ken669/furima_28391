'use strict';
setInterval(() => {
  const chargeForm = document.getElementById('charge-form');
  if(chargeForm){
    Payjp.setPublicKey('pk_test_0475934debda6602e5ac13f0');
    chargeForm.addEventListener('submit', (event)=>{
      // event.preventDefault();

      const data = new FormData(chargeForm);
      const card = {
        number: data.get('number'),
        exp_month: data.get('exp_month'),
        exp_year: data.get('exp_year'),
        cvc: `20${data.get('cvc')}`
      };
      console.log(card);
      // 
      Payjp.createToken(card, (status, res)=>{
        if(status === 200){
          const token = res.id;
          const tokenObj = `<input value="${token}" type="hidden" name="token">`;
          chargeForm.insertAdjacentHTML('beforeend', tokenObj);

          document.getElementById('card-number').removeAttribute('name');
          document.getElementById('card-exp-month').removeAttribute('name');
          document.getElementById('card-exp-year').removeAttribute('name');
          document.getElementById('card-cvc').removeAttribute('name');
          console.log(token);
          console.log(document.getElementById('card-number'));

          chargeForm.submit();
          chargeForm.reset();
        }
      });
    });
  }
}, 1000);