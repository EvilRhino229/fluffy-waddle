// $(document).ready(function() {
//   var stripe = Stripe('pk_test_m6S2QrsmCdkPcT113rYXOwAk00gen3H0dz');
//   var $checkoutButton = $("#checkout-btn");


//   $checkoutButton.on("click", function() {
//     event.preventDefault();
//     event.stopPropagation();

//     $.ajax({
//       url: "/charges",
//       type: "post",
//       headers: {"X-CSRF-TOKEN": $token},
//       dataType: "json",
//       success: function(response) {
//         stripe.redirectToCheckout({
//           sessionId: response.charge.id
//         }).then(function (result) {
//           alert(result.error.message);
//         });
//       },
//       error: function(response) {
//         console.log(response);
//       }
//     });
//   });
// });