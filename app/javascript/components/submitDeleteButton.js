function submitDeleteButton(){
  function triggerModal(event){
    let targetID = event.currentTarget.dataset.target
    let targetModal = document.getElementById(targetID)

    let submited = "submit_" + targetID
    let submitedId = document.getElementById(submited);

    targetModal.onclick = function() {
      submitedId.click()
    };
  };


  const modalButtonsList = document.querySelectorAll('.form-button')
  if ( modalButtonsList) {
    modalButtonsList.forEach((button) => {
      button.addEventListener("click", triggerModal);
    })
  }
};


export { submitDeleteButton }

