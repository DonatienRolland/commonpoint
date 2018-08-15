function checkBox(){
  const date_end = document.getElementById('number_max')
  const currently = document.getElementById('currently_checked')
  console.log(date_end)
  if (currently) {
    currently.addEventListener('change', function(){
      if (this.checked){
        date_end.classList.add('hidden');
      } else {
        date_end.classList.remove('hidden');
      };
    })
  }
};

export {checkBox}
