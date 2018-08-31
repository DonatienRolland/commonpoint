// Sliders of new trip form
import $ from "jquery";
import "bootstrap-slider";

  function initSliders() {
    var mySliderMin = document.getElementById("myRangeMin");
    var outputMin = document.getElementById("levelMin");
    var mySliderMax = document.getElementById("myRangeMax");
    var outputMax = document.getElementById("levelMax");
    if (mySliderMin) {
      outputMin.innerHTML = mySliderMin.value;
      outputMax.innerHTML = mySliderMax.value;

      // mySliderMax.min = mySliderMin.value;
      // mySliderMin.max = mySliderMax.value;



      mySliderMin.oninput = function() {
        outputMin.innerHTML = this.value;
        // mySliderMax.value > mySliderMin.value
        // mySliderMax.min = mySliderMin.value;
      }

      console.log(mySliderMin.min)

      mySliderMax.oninput = function() {
        outputMax.innerHTML = this.value;
        // mySliderMax.value > mySliderMin.value
        // mySliderMin.max = mySliderMax.value;
      }
    }

  };

export {initSliders};


