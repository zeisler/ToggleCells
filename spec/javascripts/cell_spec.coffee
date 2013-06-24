//= require script

describe "Cell", ->
  beforeEach ->
    @page = loadFixtures('../../../../index.html')


  it "toggles neighboring cells on click", ->
    $(@page).ready ->
      cell = $('.cell').first()
      cell.click()
      expect(cell).toHaveClass("blue")
