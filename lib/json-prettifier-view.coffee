{View} = require 'atom'

module.exports =
class JsonPrettifierView extends View
  @content: ->
    @div class: 'json-prettifier overlay from-top', =>
      @div "The JsonPrettifier package is Alive! It's ALIVE!", class: "message"

  initialize: (serializeState) ->
    atom.workspaceView.command "json-prettifier:toggle", => @toggle()

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @detach()

  toggle: ->
    console.log "JsonPrettifierView was toggled!"
    if @hasParent()
      @detach()
    else
      atom.workspaceView.append(this)
