

function fillDayAndHour(){
  const forms = document.querySelectorAll('.selected-date-js')
  if (forms != null) {
    forms.forEach((form) => {
      let input = form.querySelector('.point_date')
      if (input.name === undefined) {
        input = input.children[0]
      }
      const day = form.querySelector('.date_day')
      const hour = form.querySelector('.date_hour')
      function addToInput(){
        let dayValue = day.value
        let hourValue = hour.value
        input.value = dayValue + " "+ hourValue
      }
      console.log(input.value)
      if (input.value != "") {
        var str = input.value
        var words = str.split(' ');
        console.log(words[0])
        console.log(words[1])
        day.value = words[0]
        hour.value = words[1]
      }

      day.addEventListener('change', function(){
        addToInput()
      })

      hour.addEventListener('change', function(){
        addToInput()
      });
    });
  }
}

export { fillDayAndHour }



