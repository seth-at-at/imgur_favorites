function askUser(){
  let username = document.location.hash.split('&')[4].split('=')[1]
  $('#are_user')[0].append(`Are you ${username} ?`)

}


$(document).ready(function(){
  askUser()
})
