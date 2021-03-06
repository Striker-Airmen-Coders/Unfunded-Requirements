require "application_system_test_case"

class ReqsTest < ApplicationSystemTestCase
  setup do
    @req = reqs(:one)
  end

  test "visiting the index" do
    visit reqs_url
    assert_selector "h1", text: "Reqs"
  end

  test "creating a Req" do
    visit reqs_url
    click_on "New Req"

    fill_in "Cost", with: @req.cost
    fill_in "Group", with: @req.group
    fill_in "Mop", with: @req.mop
    fill_in "Name", with: @req.name
    fill_in "Pec", with: @req.pec
    fill_in "Poc", with: @req.poc
    fill_in "Title", with: @req.title
    fill_in "Unit", with: @req.unit
    click_on "Create Req"

    assert_text "Req was successfully created"
    click_on "Back"
  end

  test "updating a Req" do
    visit reqs_url
    click_on "Edit", match: :first

    fill_in "Cost", with: @req.cost
    fill_in "Group", with: @req.group
    fill_in "Mop", with: @req.mop
    fill_in "Name", with: @req.name
    fill_in "Pec", with: @req.pec
    fill_in "Poc", with: @req.poc
    fill_in "Title", with: @req.title
    fill_in "Unit", with: @req.unit
    click_on "Update Req"

    assert_text "Req was successfully updated"
    click_on "Back"
  end

  test "destroying a Req" do
    visit reqs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Req was successfully destroyed"
  end
end
