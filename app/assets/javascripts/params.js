function sendParams() {
  let params = location.hash.split("#")[1]
  $.ajax({
    method: 'POST',
    data: {params: params},
    url: '/catchtoken'
  })
}

$(document).ready(function(){
  $('#continue').on('click', sendParams)
})
