function set_last_textbox() {
    $('.tab_to_new_textbox').removeAttr('class');
    $('form>.fields:last>.field:nth-child(2)>input:nth-child(2)').addClass('tab_to_new_textbox');
    $('form>.fields>.field:nth-child(2)>input:nth-child(2)').not('.tab_to_new_textbox').addClass('tab_to_next_textbox')
}

function set_focus_to_next_field(elm) {
    $(elm).parent().parent().next().children(':first').children(':nth-child(2)').focus();
}

$(function() {

    /*$('form>.fields:last .field:nth-child(2)>input:nth-child(2)').addClass('last_textbox testing');*/
    set_last_textbox();

    $('.tab_to_new_textbox').live('keydown', function(e) {
      var keyCode = e.keyCode || e.which;

      if (keyCode == 9) {
        e.preventDefault();
        // call custom function here
        $('form a.add_child').click();
        set_last_textbox();
        set_focus_to_next_field(this);
      }
    });

    $('.tab_to_next_textbox').live('keydown', function(e) {
      var keyCode = e.keyCode || e.which;

      if (keyCode == 9) {
        e.preventDefault();
        // call custom function here
        set_focus_to_next_field(this);
      }
    });

    $('form a.add_child').click(function() {
        set_last_textbox();
    });
});

