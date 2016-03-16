// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(function () {
    $('#city-search').autocomplete({
        minLength: 3,
        source: "patient_care_scores/cities.json",
        select: function (event, ui) {
            event.preventDefault();
            $("#city-search").val(ui.item.value);
        }
    });

    $('#city-search').keypress(function (e) {
        if ((e.keyCode == 13 || e.which == 13) && !$(this).val()) {
            e.preventDefault();
        }
    });

    $("#search-btn").click(function (e) {
        if (!$('#city-search').val()) {
            e.preventDefault();
        }
    });
});