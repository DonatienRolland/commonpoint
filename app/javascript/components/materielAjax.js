// Show view
function materielAjax(){
  const form = document.getElementById("form-materiel")
  if ( form != null) {
    const inputs = form.querySelectorAll(".participant-form-show")

    inputs.forEach((input) => {
      input.addEventListener("change", function(){
        if (input.checked) {
          var sendValue = {
            user: input.value,
            equipment: input.dataset.equiment,
            checked: true
          };
        } else {
          var sendValue = {
            user: input.value,
            equipment: input.dataset.equiment,
            checked: false
          };
        }
        $.ajax({
          url: form.dataset.url,
          type: "PUT",
          data: { params_value: sendValue },
        });
      })
    })
  }

}
export { materielAjax }
