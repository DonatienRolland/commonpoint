import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!
import { French } from "flatpickr/dist/l10n/fr.js"



flatpickr(".datepicker", {

  enableTime: true,
  dateFormat: "d/m/Y à H:i",
  minDate: "today",
  time_24hr: true,
  "locale": French
})


flatpickr(".datepicker2", {

  enableTime: false,
  mode: "range",
  dateFormat: "d/m/Y",
  "locale": French
})
