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


    var language  = $( "#language_name" ),
	    abbr      = $( "#language_abbr" ),
        allFields = $( [] ).add( language ).add( abbr ),
        tips      = $( ".validate_tips > p" ),
        language_validation_tips = '';


    function updateTips( t ) {
        tips
            .text( t )
            .addClass( "ui-state-highlight" );
        setTimeout(function() {
            tips.removeClass( "ui-state-highlight", 1500 );
        }, 500 );
    }

    function checkHasValue( o, n ) {
        if ( o.val().length == 0 ) {
            o.addClass( "ui-state-error" );
            language_validation_tips += "Het veld " + n + " moet ingevuld zijn! ";
            return false;
        } else {
            return true;
        }
    }



    $('#add_language_box').dialog({
        	autoOpen: false,
			height: 250,
			width: 400,
			modal: true,
            buttons: {
				"Bewaar": function() {
					var bValid = true;
					allFields.removeClass( "ui-state-error" );

                    language_validation_tips = '';
					languageValid = checkHasValue( language, "taal");
					abbrValid     = checkHasValue( abbr,     "afkorting" );

					if ( languageValid && abbrValid ) {
                        alert('het is goed ingevuld!')
						$( this ).dialog( "close" );
					}
                    else
                    {
                        updateTips(language_validation_tips)
                    }
				},
				Annuleren: function() {
					$( this ).dialog( "close" );
				}
			},
			close: function() {
				allFields.val( "" ).removeClass( "ui-state-error" );
			}

    });

    $( "#make_new_language_link" ).click(function() {
        $( "#add_language_box" ).dialog( "open" );
        return false;
    });
});

