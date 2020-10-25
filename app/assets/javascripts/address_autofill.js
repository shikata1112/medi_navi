
$(function() {
  return $('#member_postcode').jpostal({
    postcode: ['#member_postcode'],
    address: {
      '#member_prefecture_code': '%3',
      '#member_address': '%3%4%5%6%7',
    },
  });
});