import "bootstrap";

import "../plugins/flatpickr"

import '../components/select2';

import "../components/numberStepper.js"

import "../components/mapEdit.js"

import "../components/equalHeight"

import { checkBox } from "../components/checkBox";
checkBox();

import { participantCheckBoxs, countParticipants, participantChecked } from "../components/checked";
participantCheckBoxs();
countParticipants();
participantChecked();

import { filteringParticipant, addParticipant } from "../components/filter";
filteringParticipant();
addParticipant();

import { revealModal } from "../components/modal";
revealModal();

import { submitDeleteButton } from "../components/submitDeleteButton";
submitDeleteButton();

import { bindSweetAlertButtonDemo } from '../components/banner';
bindSweetAlertButtonDemo();


import { initSliders } from "../components/slider";
// arrangeWidth();
initSliders();

import { scrollMessagesIntoView } from "../components/scroll";
// arrangeWidth();
scrollMessagesIntoView();

import { addStringToValue } from '../components/valueRange';
addStringToValue();

import { getValueMap } from '../components/valueMap';
getValueMap();

import { mapAjax } from '../components/mapAjax';
mapAjax();
