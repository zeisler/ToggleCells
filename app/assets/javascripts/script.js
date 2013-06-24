function toggleIfNeighbor(target, $cell) {
  var cell = $($cell);
  var targetRow = target.data("row");
  var targetColumn = target.data("column");
  var cellRow = cell.data("row");
  var cellColumn = cell.data("column");
  if (targetColumn == cellColumn && ((targetRow + 1 == cellRow) || (targetRow - 1 == cellRow))) {
    cell.toggleClass("blue");
  }
  if (targetRow == cellRow && ((targetColumn + 1 == cellColumn) || (targetColumn - 1 == cellColumn))) {
    cell.toggleClass("blue");
  }
  // console.log(cell.data("row"));
  // console.log(target.data("row"));
}

$(document).ready(function() {
      $('.cell').on('click', function() {
        $(this).toggleClass("blue");
        var cells = $('.cell');
        var clickedCell = $(this);
        var row = $(this).data("row");
        var column = $(this).data("column");
        // console.log(row);
        // console.log(column);
        cells.each(function () {
        toggleIfNeighbor(clickedCell, this);
      }
        );
      });
    });

    $(document).ready(function() {
      $('#wipe').on('click', function() {
        $('.cell').removeClass("blue");
      });
    });

    $(document).ready(function() {
      $('#gameBox').on('click', function() {
        if (!$('.cell').not('.blue').length) {
          alert("congratulations");
        }
      });
    });
