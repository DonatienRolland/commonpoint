import "bootstrap";

import "../plugins/flatpickr"

import '../components/select2';

import "../components/numberStepper.js"

import "../components/equalHeight"

import { checkBox } from "../components/checkBox";
checkBox();

import { participantCheckBoxs } from "../components/checked";
participantCheckBoxs();


import { revealModal } from "../components/modal";
revealModal();

import { submitDeleteButton } from "../components/submitDeleteButton";
submitDeleteButton();

import { bindSweetAlertButtonDemo } from '../components/banner';
bindSweetAlertButtonDemo();


import { initSliders } from "../components/slider";
// arrangeWidth();
initSliders();
