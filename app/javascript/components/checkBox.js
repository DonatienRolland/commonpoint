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
  function triggerModal(event){
    let targetModalID = event.currentTarget.dataset.target
    let targetModal = document.getElementById(targetModalID)
    targetModal.classList.toggle("hidden");
  }
  const modalButtonsList = document.querySelectorAll('.activity-button')
  modalButtonsList.forEach((button) => {
    button.addEventListener("click", triggerModal);
  })
}


export { addForm }



// function addForm() {
//   function addActivity(event){
//     console.log(event)
//     let targetModalID = event.currentTarget.dataset.target
//     let targetModal = document.getElementById(targetModalID)
//     let formHTML = "<%= render user_activities/form, user: @user, user_activity: @user_activity, act: act %>"
//     targetModal.insertAdjacentHTML('afterbegin', formHTML);
//   }

//   const modalButtonsList = document.querySelectorAll('.activity-button')
//   modalButtonsList.forEach((button) => {
//     button.addEventListener("click", addActivity);
//   })
// }


// export { addForm }

