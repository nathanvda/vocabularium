$(function() {

    //$('form#answer_question').css({border:'3px solid red'});
    $('form#answer_question').live('submit', function() {
        // check for empty answer!
        var answer = $('form#answer_question > .field > input').val();
        if (answer == '') {
            if (!confirm('Ben je zeker dat je geen antwoord wil geven?')) {
                return false;
            }
        }
        //alert('submitting answer!');
    });
});

