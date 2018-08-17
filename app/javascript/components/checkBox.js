function checkBox(){
  const date_end = document.getElementById('number_max')
  const currently = document.getElementById('currently_checked')
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


function addForm() {
  const triggerModal = (event) => {
    let targetModalID = event.currentTarget.dataset.target
    let targetModal = document.getElementById(targetModalID)
    console.log(targetModal.classList)
    targetModal.classList.toggle("hidden");

  }

  const modalButtonsList = document.querySelectorAll('.activity-button')
  modalButtonsList.forEach((button) => {
    button.addEventListener("click", triggerModal);
  })
}


export { addForm }

