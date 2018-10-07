function participantCheckBoxs(){
  let count = countParticipants()
  const participants = document.querySelectorAll('.participants-fields')
  const participants_added = document.querySelectorAll(".participant-added")
  const count_participants = document.querySelectorAll(".count-parcticipant")
  participants.forEach((participant) => {
    let inputs = participant.getElementsByTagName('input')
    let user_id = participant.dataset.conf
    participant.children[0].addEventListener('click', function(){
      for(var i = 0; i < inputs.length; i++){
        if(inputs[i].type=='checkbox'){
          if (inputs[i].checked) {
            inputs[i].checked = false
            count--;
            participant.classList.remove('green-icon')
            participants_added.forEach((added) => {
            let add = added.dataset.conf
              if (user_id == add) {
                added.classList.add('hidden')
              }
            })
          } else {
            inputs[i].checked = true
            count++;
            participant.classList.add('green-icon')
            participants_added.forEach((added) => {
            let add = added.dataset.conf
              if (user_id == add) {
                added.classList.remove('hidden')
              }
            })
          }
        }
      }
      count_participants.forEach((count_participant) => {
        count_participant.innerText = ""
        count_participant.innerText = count
      })
    })
  })
};

function countParticipants(){
  const participants = document.querySelectorAll('.participants-fields')
  const count_participants = document.querySelectorAll(".count-parcticipant")
  let count = 0;
  participants.forEach((participant) => {
    let inputs = participant.getElementsByTagName('input')
    for(var i = 0; i < inputs.length; i++){
      if (inputs[i].type === "checkbox" && inputs[i].checked === true) {
        count++;
      participant.classList.add('green-icon')
      count_participants.forEach((count_participant) => {
        count_participant.innerText = ""
        count_participant.innerText =  count
      })
      }
    }
  })
  return count
}

function participantChecked(){
  const participants = document.querySelectorAll('.participants-fields')
  const participants_added = document.querySelectorAll(".participant-added")
  participants.forEach((participant) => {
    let inputs = participant.getElementsByTagName('input')
    let user_id = participant.dataset.conf
    for(var i = 0; i < inputs.length; i++){
      if (inputs[i].type === "checkbox" && inputs[i].checked === true) {
        participants_added.forEach((added) => {
          let add = added.dataset.conf
          if (user_id == add) {
            added.classList.remove('hidden')
          }
        })
      }
    }
  })
}




export { participantCheckBoxs, countParticipants, participantChecked }
