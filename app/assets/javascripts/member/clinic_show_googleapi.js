
function ShowMap() {
  geocoder = new google.maps.Geocoder()

  var mapDiv = document.getElementById('showmap');
  if (mapDiv) {
    map = new google.maps.Map(document.getElementById('showmap'), {
      // コントローラーで定義した変数から緯度経度を呼び出し、マップの中心に表示
      center: {
        lat: parseFloat($('.clinic_latitude').val()),
        lng: parseFloat($('.clinic_longitude').val())
      },
      zoom: 16,
    });
  
    marker = new google.maps.Marker({
      // コントローラーで定義した変数から緯度経度を呼び出し、マーカーを立てる
      position: {
        lat: parseFloat($('.clinic_latitude').val()),
        lng: parseFloat($('.clinic_longitude').val())
      },
      map: map
    });
  }
}
