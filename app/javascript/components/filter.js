function filteringParticipant(form){
  const btns = document.querySelectorAll(".bouton-participant")
  const test = document.getElementById("v-pills-tabContent")

  btns.forEach((btn) => {
    btn.addEventListener('click', function(event){
      let star = event.currentTarget.dataset.target
      let classValue0 = ".zerolevel"
      let classValue1 = ".onelevel"
      let classValue2 = ".twolevel"
      let classValue3 = ".threelevel"
      let classValue4 = ".forlevel"
      let classValue5 = ".fivelevel"
      let inputs0 = document.querySelectorAll(classValue0)
      let inputs1 = document.querySelectorAll(classValue1)
      let inputs2 = document.querySelectorAll(classValue2)
      let inputs3 = document.querySelectorAll(classValue3)
      let inputs4 = document.querySelectorAll(classValue4)
      let inputs5 = document.querySelectorAll(classValue5)

      var arrayInput = [ inputs0, inputs1, inputs2, inputs3, inputs4, inputs5 ]
      console.log(arrayInput)

      if (star == "all") {
        for (var e = 0; e < 6; e++) {
          for (var i = 0; i < arrayInput[e].length; i++) {
            arrayInput[e][i].classList.remove('hidden');
          }
        }
      } else {
        for (var e = 0; e < 6; e++) {
          if (e != star) {
            for (var i = 0; i < arrayInput[e].length; i++) {
              arrayInput[e][i].classList.toggle('hidden');
            }
          }
        }
      }

    })
  })
};



export { filteringParticipant }
