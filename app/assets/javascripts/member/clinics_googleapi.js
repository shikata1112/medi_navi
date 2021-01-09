function initMap(markerData) {
  if (markerData === undefined) return;
    let map;
    let marker = [];
    let infoWindow = [];
  
    geocoder = new google.maps.Geocoder()
  
    map = new google.maps.Map(document.getElementById('map'), {
      // コントローラーで定義した変数から緯度経度を呼び出し、マップの中心に表示
      center: {
        lat: parseFloat($('.current_member_latitude').val()),
        lng: parseFloat($('.current_member_longitude').val())
      },
      zoom: 15,
    });
  
    // 繰り返し処理でマーカーと吹き出しを複数表示させる
    for (var i = 0; i < markerData.length; i++) {
      let id = markerData[i]['id']
  
            // 各地点の緯度経度を算出
      markerLatLng = new google.maps.LatLng({
        lat: parseFloat(markerData[i]['latitude']),
        lng: parseFloat(markerData[i]['longitude'])
      });
  
      // 各地点のマーカーを作成
      marker[i] = new google.maps.Marker({
        position: markerLatLng,
        map: map  
      });
  
      // マーカーにクリックイベントを追加
      markerEvent(i, markerData, marker, infoWindow, map);
    }
  }
  
  // マーカーをクリックしたら吹き出しを表示
function markerEvent(i, markerData, marker, infoWindow, map) {
  marker[i].addListener('click', function () {
    infoWindow[i].open(map, marker[i]);
  });

  let id = markerData[i]['id']

  infoWindow[i] = new google.maps.InfoWindow({
    content: `<a href='/member/clinics/${ id }'>${ markerData[i]['name'] }</a>`
  });
}

$(document).ready(function(){
  $.ajax({
    url: '/api/clinics',
    dataType: "json"
  })
  .done(function(data) {
    initMap(data);
  })
  .fail(function() {
    console.log('error')
  })
});
