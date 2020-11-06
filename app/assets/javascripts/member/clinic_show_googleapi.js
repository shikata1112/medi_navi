
function ShowMap() {
  geocoder = new google.maps.Geocoder()

  console.log('test');

  map = new google.maps.Map(document.getElementById('map'), {
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