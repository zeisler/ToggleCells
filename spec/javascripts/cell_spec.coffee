//= require script
describe "Cell", ->
  beforeEach ->
    loadFixtures('../../../../index.html')

  it "toggles neighboring cells on click", ->
    cell = $('.cell:first')
    cell.click()
    expect(cell).toHaveClass("blue")