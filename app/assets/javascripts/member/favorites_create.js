$(function() {

  $("#favorite").on('click', function() {
    if ($("#favorite").attr('data-action') === 'create') {
        var clinicId = $('[data-clinic-id]').data().clinicId

        $.ajax({
          url: '/member/clinics/' + `${clinicId}` + '/favorites',
          dataType: "json",
          type: 'POST',
        })
        .done(function() {
          $('#favorite').removeClass('favorite');
          $('#favorite').text('お気に入り済み');
          $('#favorite').prepend('<i class="far fa-star"></i>');
          $('#favorite')[0].dataset.action = 'delete';
          $("#favorite").addClass("unfavorite");
        })
    } else {
        var clinicId = $('[data-clinic-id]').data().clinicId
    
        $.ajax({
          url: '/member/clinics/' + `${clinicId}` + '/favorites',
          dataType: "json",
          type: 'DELETE',
        })
        .done(function() {
          $('#favorite').removeClass('unfavorite');
          $('#favorite').text('お気に入り登録');
          $('#favorite').prepend('<i class="far fa-star"></i>');
          $('#favorite')[0].dataset.action = 'create';
          $("#favorite").addClass("favorite");
        })
    }
  })
});
