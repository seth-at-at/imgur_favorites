function showFolders(){
  debugger
  this.append(``)
  $.ajax({
    method: 'GET',
    data: {params: params},
    url: `/folders`
  })
}

function tempFunction(){
  $.ajax({
    method: 'GET',
    data: {params: params},
    url: `/folder/${}`
  })
}

$(document).ready(function(){
  $('.favorites img').on('click', showFolders)
})
