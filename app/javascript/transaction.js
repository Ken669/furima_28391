'use strict';
{
  let eventReady = false;
  setInterval(() => {
    const chargeForm = document.getElementById('charge-form');
    if(chargeForm){
      function addEvent(chargeForm){
        Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
        chargeForm.addEventListener('submit', ()=>{
          const data = new FormData(chargeForm);
          const card = {
            number: data.get('address[number]'),
            exp_month: data.get('address[exp_month]'),
            exp_year: 20 + data.get('address[exp_year]'),
            cvc: data.get('address[cvc]')
          };
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
    
              chargeForm.submit();
              chargeForm.reset();
            }
          });
        });
      }
      if(!eventReady){
        addEvent(chargeForm);
        eventReady = true;
      }
    }
  }, 1000);
}
