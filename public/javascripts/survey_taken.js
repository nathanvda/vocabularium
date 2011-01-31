$(function() {

    // create a convenient toggleLoading function
    var toggleLoading = function() { $("#loading").toggle() };
    var checkPostAndToggle = function() {
        toggleLoading();
        var answer = $('form#answer_question > .field > input').val();
        if (answer == '') {
            if (!confirm('Ben je zeker dat je geen antwoord wil geven?')) {
                toggleLoading();
                return false;
            }
        }
        return true;
    };
    $("form#answer_question")
      .live("ajax:beforeSend", checkPostAndToggle )
      .live("ajax:complete",   function() {  } )
      .live("ajax:success",    function(event, data, status, xhr) {
        $("#current_question").html(data);
      });

    $("form#answer_question .autofocus").focus();

//});

//  $("form#answer_question")
//    .bind("ajax:loading",  toggleLoading)
//    .bind("ajax:complete", toggleLoading)
//    .bind("ajax:success", function(event, data, status, xhr) {
//      $("#current_question").html(data);
//    });

    //$('form#answer_question').css({border:'3px solid red'});
//    $('form#answer_question').live('submit', function() {
//        // check for empty answer!
//        var answer = $('form#answer_question > .field > input').val();
//        if (answer == '') {
//            if (!confirm('Ben je zeker dat je geen antwoord wil geven?')) {
//                return false;
//            }
//        }
//        //alert('submitting answer!');
//    });
});

