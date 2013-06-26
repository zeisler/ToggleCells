//= require script

describe "Cell", ->
  cells = null
  game = null
  grid = null
  beforeEach ->
    game = new Cells
    grid = game.generate_grid()
    game.set_click()
    console.log(grid)
    cells = grid.find('.cell')
    console.log cells

  it "toggles cell when clicked", ->
    cells[0].click()
    expect(cells[0]).toHaveClass("blue")
  it "toggles neighboring cells on click", ->
    cells[0].click()
    expect(cells[1]).toHaveClass("blue")
    expect(cells[3]).toHaveClass("blue")
      # This is only works because the grid is three cells wide
  it "clears blue class when wipe is clicked", ->
    game.set_wipe()
    for cell in cells
      cell.click()
    wipe = grid.find('#wipe')
    wipe.click()
    for cell in cells
      expect(cell).not.toHaveClass("blue")
  it "alerts user with 'congratulations' when all cells are blue", ->
    game.set_alert(grid)
    spyOn(game, "send_alert")
    # Winning combination
    cells[0].click()
    cells[2].click()
    cells[6].click()
    cells[8].click()
    cells[4].click()
    expect(game.send_alert).toHaveBeenCalledWith("congratulations")
