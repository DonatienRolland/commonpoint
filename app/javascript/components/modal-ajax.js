function closeModal(){
  const close = document.getElementById('close_activity')
  const modalWindow = document.getElementById('modal-activity');
  close.addEventListener('click', function(){
    modalWindow.innerHTML = ""
  })
}

function deleteFrom(){

}

export { closeModal }
