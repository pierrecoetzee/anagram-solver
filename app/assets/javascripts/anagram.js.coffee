class Anagram
  init: ->
    
    $(document).ajaxSuccess (event, xhr, settings, exception) ->
      $('#results').text xhr.responseText

@AnagramApp = {} unless @AnagramApp?
@AnagramApp.results_manager = new Anagram()    
$(document).ready -> AnagramApp.results_manager.init()