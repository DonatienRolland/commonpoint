// var stepper = function () {
//   var stepperNumber,
//       minusButton;

//   return {

//     allSteppers: $( '.input-stepper' ),

//     // check to see if the input is at '0'...
//     checkStepperNumber: function ( thisStepper ) {
//       stepperInput = $( thisStepper ).find( 'input' );
//       stepperNumber = stepperInput.val();
//       decrementButton = $( thisStepper ).find( 'p.minus' );

//       if ( stepperNumber === '0' || stepperNumber <= 0 ) {
//         // if so, disable the minus button.
//         decrementButton.prop( 'disabled', true );
//         stepperInput.val( 0 );
//       } else {
//         // if number is positive, enable the minus button
//         decrementButton.prop( 'disabled', false );
//       }

//     },

//     init: function () {
//       stepper.allSteppers.each( function ( index, element ) {
//         var thisStepperInput = $( element ).find( 'input' );
//         var thisMinusButton = $( element ).find( 'p.minus' );
//         if ( thisStepperInput.val() === '0' || thisStepperInput.val() <= 0 ) {
//           thisMinusButton.prop( 'disabled', true );
//           thisStepperInput.val(  );
//         } else {
//           // if number is positive, enable the minus button
//           thisMinusButton.prop( 'disabled', false );
//         }
//       });
//     }

//   }
// }();

// // on button.plus click ...
// $( '.input-stepper p.plus' ).on( 'click', function ( e ) {
//   thisStepper = $( e.target ).closest( '.input-stepper' );
//   stepperInput = thisStepper.find( 'input' );

//   // check the input value
//   stepperNumber = stepperInput.val();

//   // increment the input value
//   stepperNumber++;
//   stepperInput.val( stepperNumber );

//   // then check the stepper number
//   stepper.checkStepperNumber( thisStepper );
// });

// // on button.minus click ...
// $( '.input-stepper p.minus' ).on( 'click', function ( e ) {
//   thisStepper = $( e.target ).closest( '.input-stepper' );
//   stepperInput = thisStepper.find( 'input' );

//   // check the input value
//   stepperNumber = stepperInput.val();

//   // decrement the input value
//   stepperNumber--;
//   stepperInput.val( stepperNumber );

//   // then check the stepper number
//   stepper.checkStepperNumber( thisStepper );
// });

// // on input field blur ...
// $( '.input-stepper input' ).on( 'blur', function ( e ) {
//   thisStepper = $( e.target ).closest( '.input-stepper' );
//   // check the stepper number
//   stepper.checkStepperNumber( thisStepper );
// });

// // check the stepper number on load
// if ( $( '.input-stepper' ).length ) {
//   stepper.init();
//  }
