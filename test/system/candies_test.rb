require "application_system_test_case"

class CandiesTest < ApplicationSystemTestCase
  setup do
    @candy = candies(:one)
  end

  test "visiting the index" do
    visit candies_url
    assert_selector "h1", text: "Candies"
  end

  test "creating a Candy" do
    visit candies_url
    click_on "New Candy"

    fill_in "Name", with: @candy.name
    click_on "Create Candy"

    assert_text "Candy was successfully created"
    click_on "Back"
  end

  test "updating a Candy" do
    visit candies_url
    click_on "Edit", match: :first

    fill_in "Name", with: @candy.name
    click_on "Update Candy"

    assert_text "Candy was successfully updated"
    click_on "Back"
  end

  test "destroying a Candy" do
    visit candies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Candy was successfully destroyed"
  end
end
