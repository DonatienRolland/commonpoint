import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!
import { French } from "flatpickr/dist/l10n/fr.js"



flatpickr(".datepicker2", {

  enableTime: true,
  dateFormat: "d/m/Y à H:i",
  minDate: "today",
  time_24hr: true,

  "locale": French,
  // onShow:function(dateText, inst) {
  //   $('#ui-datepicker-div').css("display","none");
  // },
  // onClose: function(dateText, inst) {
  //   $('#ui-datepicker-div').css("display","none");
  // }
})


flatpickr(".datepicker234", {
  enableTime: false,
  // altInput: true,
  altFormat: "D j F Y",
  dateFormat: "d/m/Y",
  allowInput: true,
  noCalendar: false,
  "locale": French,
})

flatpickr(".hourpicker", {
  enableTime: true,
  noCalendar: true,
  dateFormat: "H:i",
  minuteIncrement: 5,
  time_24hr: true
})

