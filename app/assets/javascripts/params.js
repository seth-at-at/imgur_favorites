function sendParams() {
  var params = location.hash.split("#")[1]
  $.ajax({
    method: 'POST',
    data: {params: params},
    url: '/catchtoken'
  })
}

function clearSession() {
  var params = "clear"
  $.ajax({
    method: 'GET',
    data: {params: params},
    url: ''
  })
}

$(document).ready(function(){
  $('#continue').on('click', sendParams)
  $('#back').on('click', clearSession())
})
