require "application_system_test_case"

class NewsTest < ApplicationSystemTestCase
  setup do
    @news = news(:one)
  end

  test "visiting the index" do
    visit news_index_url
    assert_selector "h1", text: "News"
  end

  test "creating a News" do
    visit news_index_url
    click_on "New News"

    fill_in "Title", with: @news.title
    click_on "Create News"

    assert_text "News was successfully created"
    click_on "Back"
  end

  test "updating a News" do
    visit news_index_url
    click_on "Edit", match: :first

    fill_in "Title", with: @news.title
    click_on "Update News"

    assert_text "News was successfully updated"
    click_on "Back"
  end
end
