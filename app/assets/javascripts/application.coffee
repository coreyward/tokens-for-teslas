#= require jquery
#= require jquery_ujs
#= require turbolinks

initializeFormLabels = ->
  # Form labels
  inputs = $('label + input')
  inputs.each ->
    input = $(this)
    if input.val().length > 0
      input.siblings('label').addClass('active-input')

  inputs.on 'focus', ->
    input = $(this)
    label = input.siblings('label')
    label.addClass('active-input')

  inputs.on 'blur change', ->
    input = $(this)

    if /^\s*$/.test input.val()
      label = input.siblings('label')
      input.val('')
      label.removeClass('active-input')

$(document).on 'turbolinks:load', ->
  # Form
  initializeFormLabels()
