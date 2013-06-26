window.Cells = class Cells
  grid: null
  run: ->
    @generate_grid()
    $('body').html(@grid)
    @grid = $('body')
    @set_click()
    @set_wipe()
    @set_alert()
  toggleIfNeighbor = (target, $cell) ->
    cell = $($cell)
    targetRow = target.data("row")
    targetColumn = target.data("column")
    cellRow = cell.data("row")
    cellColumn = cell.data("column")
    cell.toggleClass "blue"  if targetColumn is cellColumn and ((targetRow + 1 is cellRow) or (targetRow - 1 is cellRow))
    cell.toggleClass "blue"  if targetRow is cellRow and ((targetColumn + 1 is cellColumn) or (targetColumn - 1 is cellColumn))
  send_alert: (input) ->
      alert(input)
      console.log("alert was sent")
  set_click: () ->
    cells = @grid.find('.cell')
    that = this
    cells.on "click", ->
      console.log("a cell was clicked")
      $(@).toggleClass "blue"
      cells = that.grid.find('.cell')
      clickedCell = $(this)
      row = $(this).data("row")
      column = $(this).data("column")
      for cell in cells
        toggleIfNeighbor clickedCell, cell
  set_wipe: () ->
    wipe = @grid.find('#wipe')
    cells = @grid.find('.cell')
    wipe.on "click", ->
      cells.removeClass "blue"
  set_alert: () ->
    gameBox = @grid.find('#gameBox')
    cells = @grid.find('.cell')
    cells.on "click", =>
      console.log("in gameBox bind")
      if cells.not(".blue").length == 0
        @send_alert("congratulations")
  generate_grid: ->
    @grid = $("<div id = \"gameBox\">\
      <div>\
          <div class = \"cell\" data-row=\"1\" data-column=\"1\"></div>\
          <div class = \"cell\" data-row=\"1\" data-column=\"2\"></div>\
          <div class = \"cell\" data-row=\"1\" data-column=\"3\"></div>\
      </div>\
      <div>\
          <div class = \"cell\" data-row=\"2\" data-column=\"1\"></div>\
          <div class = \"cell\" data-row=\"2\" data-column=\"2\"></div>\
          <div class = \"cell\" data-row=\"2\" data-column=\"3\"></div>\
      </div>\
      <div>\
          <div class = \"cell\" data-row=\"3\" data-column=\"1\"></div>\
          <div class = \"cell\" data-row=\"3\" data-column=\"2\"></div>\
          <div class = \"cell\" data-row=\"3\" data-column=\"3\"></div>\
      </div>\
      <a id= \"wipe\" href=\"\">wipe</a>\
    </div>")

$(document).ready ->
  game = new Cells
  grid = game.run()
