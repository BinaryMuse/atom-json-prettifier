prettify = (text, editor, range) ->
  try
    prettified = JSON.stringify(JSON.parse(text), null, atom.config.get('editor.tabLength'))
    if range
      editor.setTextInBufferRange(range, prettified)
    else
      editor.setText(prettified)
  catch e
    console.log "Exception:", e

module.exports =
  activate: (state) ->
    atom.workspaceView.command 'json-prettifier:prettify-json', ->
      editor = atom.workspace.getActiveEditor()
      return unless editor?

      range = editor.getSelectedBufferRange()
      if range.isEmpty()
        prettify editor.getText(), editor
      else
        prettify editor.getSelectedText(), editor, range
