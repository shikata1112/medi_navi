
$(function(){
  var areas = [
    {"code": 1 , "name":"北海道地方", "color":"#ca93ea", "hoverColor":"gray", "hoverfontSize":"15", "prefectures":[1]},
    {"code": 2 , "name":"東北地方",   "color":"#a7a5ea", "hoverColor":"gray", "prefectures":[2,3,4,5,6,7]},
    {"code": 3 , "name":"関東地方",   "color":"#84b0f6", "hoverColor":"gray", "prefectures":[8,9,10,11,12,13,14]},
    {"code": 4 , "name":"北陸・甲信越地方",   "color":"#52d49c", "hoverColor":"gray", "prefectures":[15,16,17,18,19,20]},
    {"code": 4 , "name":"東海地方",   "color":"#77e18e", "hoverColor":"gray", "prefectures":[21,22,23,24]},
    {"code": 6 , "name":"近畿地方",   "color":"#f2db7b", "hoverColor":"gray", "prefectures":[25,26,27,28,29,30]},
    {"code": 7 , "name":"中国地方",   "color":"#f9ca6c", "hoverColor":"gray", "prefectures":[31,32,33,34,35]},
    {"code": 8 , "name":"四国地方",   "color":"#fbad8b", "hoverColor":"gray", "prefectures":[36,37,38,39]},
    {"code": 9 , "name":"九州地方",   "color":"#f7a6a6", "hoverColor":"gray", "prefectures":[40,41,42,43,44,45,46]},
    {"code":10 , "name":"沖縄地方",   "color":"#ea89c4", "hoverColor":"gray", "prefectures":[47]}
  ];

  $("#map-container").japanMap(
      {
          width: 700,
          selection: "prefecture",
          areas: areas,
          backgroundColor : "white",
          borderLineColor: "black",
          borderLineWidth : 0.25,
          lineColor : "#a0a0a0",
          lineWidth: 1,
          drawsBoxLine: true,
          movesIslands : true,
          showsPrefectureName: true,
          prefectureNameType: "short",
          fontShadowColor : "black",
          fontSize : 11,
          fontColor : "areaColor",
          onSelect:function(data){
              window.location.href = 'https://medi-navi.site/clinics/prefecture_search?name=' + data.name;
        },
      }
  );
});
