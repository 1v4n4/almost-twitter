require "application_system_test_case"

class TvitsTest < ApplicationSystemTestCase
  setup do
    @tvit = tvits(:one)
  end

  test "visiting the index" do
    visit tvits_url
    assert_selector "h1", text: "Tvits"
  end

  test "creating a Tvit" do
    visit tvits_url
    click_on "New Tvit"

    fill_in "Tvit", with: @tvit.tvit
    click_on "Create Tvit"

    assert_text "Tvit was successfully created"
    click_on "Back"
  end

  test "updating a Tvit" do
    visit tvits_url
    click_on "Edit", match: :first

    fill_in "Tvit", with: @tvit.tvit
    click_on "Update Tvit"

    assert_text "Tvit was successfully updated"
    click_on "Back"
  end

  test "destroying a Tvit" do
    visit tvits_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tvit was successfully destroyed"
  end
end
