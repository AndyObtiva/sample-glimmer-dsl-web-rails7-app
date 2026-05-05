require "application_system_test_case"

class ConferenceTalksTest < ApplicationSystemTestCase
  setup do
    @conference_talk = conference_talks(:one)
  end

  test "visiting the index" do
    visit conference_talks_url
    assert_selector "h1", text: "Conference talks"
  end

  test "should create conference talk" do
    visit conference_talks_url
    click_on "New conference talk"

    fill_in "Bio", with: @conference_talk.bio
    fill_in "Description", with: @conference_talk.description
    fill_in "Speaker", with: @conference_talk.speaker
    fill_in "Title", with: @conference_talk.title
    fill_in "Track", with: @conference_talk.track
    click_on "Create Conference talk"

    assert_text "Conference talk was successfully created"
    click_on "Back"
  end

  test "should update Conference talk" do
    visit conference_talk_url(@conference_talk)
    click_on "Edit this conference talk", match: :first

    fill_in "Bio", with: @conference_talk.bio
    fill_in "Description", with: @conference_talk.description
    fill_in "Speaker", with: @conference_talk.speaker
    fill_in "Title", with: @conference_talk.title
    fill_in "Track", with: @conference_talk.track
    click_on "Update Conference talk"

    assert_text "Conference talk was successfully updated"
    click_on "Back"
  end

  test "should destroy Conference talk" do
    visit conference_talk_url(@conference_talk)
    click_on "Destroy this conference talk", match: :first

    assert_text "Conference talk was successfully destroyed"
  end
end
