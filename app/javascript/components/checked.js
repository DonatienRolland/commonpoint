function participantCheckBoxs(){
  const participants = document.querySelectorAll('.participants-fields')
  participants.forEach(function(elem){
    elem.addEventListener('click', function(){
      let input = this.children[1].children[0].children[0].children[1]
      if (input.checked) {
        input.checked = false
      } else {
        input.checked = true
      }
    })
  })
  displayName(participants)
};


function displayName(elements){
  elements.forEach(function(elem){
    let input = elem.children[1].children[0].children[0].children[1]
    if (input.checked) {
      // console.log(elem)
    }
  })
}


export { participantCheckBoxs }
