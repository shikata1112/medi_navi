$(document).on(function(){
  $.ajax({
    url: '/member/clinics/:clinic_id/favorites',
    dataType: "json",
    type: 'POST',
    data: { 'clinic_id': clinic_id,
            'member_id': member_id 
          }
  })
  .done(function(data) {
    
  })
});