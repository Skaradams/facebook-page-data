# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $('.search-form').find('.submit').on 'click', -> 
    reset_page()
    form = $(this).parent()
    console.log(form)
    if id = form.find('.fb-page-id').val()
      fetch_facebook_data form.data('endpoint') + "/" + id, form.data('access_token')
    else
      $('.notice').text('Veuillez entrer un ID')

fetch_facebook_data = (url, access_token) ->
  console.log(url, access_token)
  $.ajax({
    type: "GET",
    url: url,
    data: {
      access_token: access_token
    }
    success: (data) ->
      fill_page_with data
    error: ->
      console.log('qdqsdqs')
      $('.notice').text('ID inexistant')
  })

fill_page_with = (data) ->
  for value in ['name', 'likes', 'about', 'category']
    do (value) ->
      if data[value] and node = $(".page-data").find('.' + value)
        node.text(data[value])

reset_page = ->
  $('.notice').text('')
  for value in ['name', 'likes', 'about', 'category']
    do (value) ->
      $(".page-data").find('.' + value).text('')