//= require script

describe "Cell", ->
  beforeEach ->
    @page = loadFixtures('index.html')

  it "toggles cell when clicked", ->
    $().ready ->
      cells = $('.cell')
      console.log cells
      cells[0].click()
      expect(cells[0]).toHaveClass("blue")
  it "toggles neighboring cells on click", ->
    $().ready ->
      cells = $('.cell')
      console.log cells
      cells[0].click()
      expect(cells[1]).toHaveClass("blue")
      expect(cells[3]).toHaveClass("blue")
      # This is only works because the grid is three cells wide
