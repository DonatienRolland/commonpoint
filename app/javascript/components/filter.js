function filteringParticipant(){
  const btns = document.querySelectorAll(".bouton-participant")
  const participants = document.querySelectorAll(".participants-fields")

  // get the value off the div where we clic
  btns.forEach((btn) => {
    btn.addEventListener('click', function(event){
      let star = event.currentTarget.dataset.target

      participants.forEach((participant) => {
        participant.classList.remove('hidden')
        let parti = participant.dataset.target
        if (star == "all") {
          participant.classList.remove('hidden')
        } else {
          if (star != parti) {
            participant.classList.add('hidden')
          }
        }
      })
    })
  })
};





function addParticipant(){
  const participants = document.querySelectorAll(".participants-fields")
  const participants_added = document.querySelectorAll(".participant-added")
  // participants.forEach((participant) => {
  //   participant.addEventListener('click', function(event){
  //     let user_id = event.currentTarget.dataset.conf
  //     participants_added.forEach((added) => {
  //       let add = added.dataset.conf
  //       if (user_id == add) {
  //         added.classList.toggle('hidden')
  //       }
  //     })
  //   })
  // })
}


export { filteringParticipant, addParticipant }
