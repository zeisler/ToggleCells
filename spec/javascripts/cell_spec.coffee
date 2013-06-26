//= require script

describe "Cell", ->
  it "toggles cell when clicked", ->
    game = new Cells
    grid = game.generate_grid()
    game.set_click(grid)
    console.log(grid)
    cells = grid.find('.cell')
    console.log cells

    cells[0].click()
    expect(cells[0]).toHaveClass("blue")
  it "toggles neighboring cells on click", ->
    game = new Cells
    grid = game.generate_grid()
    game.set_click(grid)
    console.log(grid)
    cells = grid.find('.cell')
    console.log cells

    cells[0].click()
    expect(cells[1]).toHaveClass("blue")
    expect(cells[3]).toHaveClass("blue")
      # This is only works because the grid is three cells wide
  it "clears blue class when wipe is clicked", ->
    game = new Cells
    grid = game.generate_grid()
    game.set_click(grid)
    console.log(grid)
    cells = grid.find('.cell')
    console.log cells

    game.set_wipe(grid)
    for cell in cells
      cell.click()
    wipe = grid.find('#wipe')
    wipe.click()
    for cell in cells
      expect(cell).not.toHaveClass("blue")
  it "alerts user with 'congratulations' when all cells are blue", ->
    game = new Cells
    grid = game.generate_grid()
    game.set_click(grid)
    game.set_alert(grid)
    console.log(grid)
    cells = grid.find('.cell')
    console.log cells

    spyOn(game, "send_alert")
    # game.send_alert("congratulations")
    cells[0].click()
    cells[2].click()
    cells[6].click()
    cells[8].click()
    cells[4].click()
    # gameBox = grid.find('#gameBox')
    # gameBox.click()
    console.log(cells)
    expect(game.send_alert).toHaveBeenCalledWith("congratulations")
