function filteringParticipant(){
  const btns = document.querySelectorAll(".bouton-participant")
  const participants = document.querySelectorAll(".participants-fields")

  // get the value off the div where we clic
  if ( btns != null) {
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
  }
};


export { filteringParticipant }
