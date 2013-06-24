toggleIfNeighbor = (target, $cell) ->
  cell = $($cell)
  targetRow = target.data("row")
  targetColumn = target.data("column")
  cellRow = cell.data("row")
  cellColumn = cell.data("column")
  cell.toggleClass "blue"  if targetColumn is cellColumn and ((targetRow + 1 is cellRow) or (targetRow - 1 is cellRow))
  cell.toggleClass "blue"  if targetRow is cellRow and ((targetColumn + 1 is cellColumn) or (targetColumn - 1 is cellColumn))

# console.log(cell.data("row"));
# console.log(target.data("row"));
$(document).ready ->
  $(".cell").on "click", ->
    $(this).toggleClass "blue"
    cells = $(".cell")
    clickedCell = $(this)
    row = $(this).data("row")
    column = $(this).data("column")

    # console.log(row);
    # console.log(column);
    cells.each ->
      toggleIfNeighbor clickedCell, this



$(document).ready ->
  $("#wipe").on "click", ->
    $(".cell").removeClass "blue"


$(document).ready ->
  $("#gameBox").on "click", ->
    alert "congratulations"  unless $(".cell").not(".blue").length
