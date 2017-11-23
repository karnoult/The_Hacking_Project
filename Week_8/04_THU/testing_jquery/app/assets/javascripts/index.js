$(document).ready(function () {
    var screen_shown = 1;
    
    $(':button').click(function () {
        if (screen_shown != this.value) {
            $('#screen_' + screen_shown).slideUp();
            screen_shown = this.value;
            $('#screen_' + screen_shown).slideDown();
        }
    });
});