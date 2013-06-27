window.Cells = class Cells
  grid: null
  grid_size: 16
  with: null
  run: ->
    console.log "Inside run"
    @generate_grid()
    @set_click()
    @set_wipe()
    @set_alert()
    @set_grid_select()
    $('body').html(@grid)
    @grid = $('body')
  toggleIfNeighbor = (target, $cell) ->
    cell = $($cell)
    targetRow = target.data("row")
    targetColumn = target.data("column")
    cellRow = cell.data("row")
    cellColumn = cell.data("column")

    if targetColumn is cellColumn
      if (targetRow + 1 is cellRow) or (targetRow - 1 is cellRow)
        cell.toggleClass "blue"
    if targetRow is cellRow
      if (targetColumn + 1 is cellColumn) or (targetColumn - 1 is cellColumn)
        cell.toggleClass "blue"

  send_alert: (input) ->
      alert(input)
      console.log("alert was sent")

  set_grid_select: ->
    select_grid_size = $('<select id="size"></select>')
    min = 3
    max = 20
    range = [min..max]

    for number in range
      value = (number * number)
      select_grid_size.append $("<option value='#{value}'>#{value}</option>")

    option = $(select_grid_size).find('option')
    selected = $('select option[value="' + @grid_size + '"]')
    selected.attr("selected", "selected")
    @grid.append $('<label for="size">Grid Size</label>')
    @grid.append $(select_grid_size)
    console.log "Inside set grid"
    that = this
    # $(select_grid_size).change "click", ->
    #   console.log "Inside option click bind"
    #   @grid_size = $("select option:selected").val()
    #   console.log "$(this).attr(\"selected\").text() = " + $("select option:selected").val()
    #   console.log "this grid size is " + @grid_size
    #   $(@grid).find('#gameBox .row').empty()
    #   $('#gameBox .row').empty()
    #   that.run()


  set_click: ->
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

  set_wipe: ->
    @grid.append($('<a id="wipe" href="">wipe</a>'))
    wipe = @grid.find('#wipe')
    cells = @grid.find('.cell')
    wipe.on "click", ->
      cells.removeClass "blue"

  set_alert: ->
    gameBox = @grid.find('#gameBox')
    cells = @grid.find('.cell')

    cells.on "click", =>
      console.log("in gameBox bind")

      if cells.not(".blue").length == 0
        @send_alert("congratulations")

  generate_grid: (grid_size)->
    console.log "Inside generate_grid"
    console.log "grid_size: " + @grid_size
    # add logic
    @width = Math.sqrt @grid_size
    columns = rows = [1..@width]
    @grid = $('<div id="gameBox"></div>')

    for row in rows
      div_row = $("<div class='row' id='#{row}'></div>")
      for column in columns
        div_row.append($("<div class=\"cell\" data-row=\"#{row}\" data-column=\"#{column}\"></div>"))
      @grid.append(div_row)

    return @grid

$(document).ready ->
  game = new Cells
  grid = game.run()
