# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#

Tweet =

  page_refresh: 120000
  slide_delay: 6000

  init: ->
    setTimeout((->window.location.reload()), @page_refresh)
    setInterval(Tweet.next, @slide_delay)

  next: ->
    impress().next()

$ ->
  Tweet.init()
  impress()
