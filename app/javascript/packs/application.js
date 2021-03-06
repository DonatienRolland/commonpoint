

import "bootstrap";

import "../plugins/flatpickr"

import '../components/select2';

import "../components/numberStepper.js"


import "../components/equalHeight"

import { checkBox } from "../components/checkBox";
checkBox();

import { participantCheckBoxs, countParticipants, participantChecked } from "../components/checked";
participantCheckBoxs();
countParticipants();
participantChecked();

import { filteringParticipant } from "../components/filter";
filteringParticipant();

import { revealModal } from "../components/modal";
revealModal();

import { submitDeleteButton } from "../components/submitDeleteButton";
submitDeleteButton();

import { bindSweetAlertButtonDemo } from '../components/banner';
bindSweetAlertButtonDemo();

import { initSliders } from "../components/slider";
initSliders();


import { mapAjax } from '../components/mapAjax';
mapAjax();

import { participationsAjaxShow } from '../components/participantAjax';
participationsAjaxShow();

import { materielAjax } from '../components/materielAjax';
materielAjax();

import { fillDayAndHour } from '../components/fillInput';
fillDayAndHour();

import { autocomplete } from '../components/autocomplete';
autocomplete();


import { scrollMessagesIntoView } from "../components/scroll";
scrollMessagesIntoView();

