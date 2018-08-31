import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!
import { French } from "flatpickr/dist/l10n/fr.js"



flatpickr(".datepicker", {

  enableTime: true,
  dateFormat: "d/m/Y H:i",
  minDate: "today",
  "locale": French
})


flatpickr(".datepicker2", {

  enableTime: false,
  dateFormat: "d/m/Y",
  "locale": French
})
