//= require script

describe "Cell", ->
  cells = game = grid = null
  beforeEach ->
    game = new Cells
    # grid_size = Math.random() * (100 - 9) + 9;
    grid = game.generate_grid(49)
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
    expect(cells[game.width]).toHaveClass("blue")
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
    # cells[2].click()
    # cells[6].click()
    # cells[8].click()
    # cells[4].click()
    for cell in cells
      $(cell).addClass('blue')

    $(cells[0]).trigger('click')
    $(cells[0]).trigger('click')

    expect(game.send_alert).toHaveBeenCalledWith("congratulations")
