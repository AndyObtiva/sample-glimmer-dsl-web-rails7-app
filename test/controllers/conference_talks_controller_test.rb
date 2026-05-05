require "test_helper"

class ConferenceTalksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @conference_talk = conference_talks(:one)
  end

  test "should get index" do
    get conference_talks_url
    assert_response :success
  end

  test "should get new" do
    get new_conference_talk_url
    assert_response :success
  end

  test "should create conference_talk" do
    assert_difference("ConferenceTalk.count") do
      post conference_talks_url, params: { conference_talk: { bio: @conference_talk.bio, description: @conference_talk.description, speaker: @conference_talk.speaker, title: @conference_talk.title, track: @conference_talk.track } }
    end

    assert_redirected_to conference_talk_url(ConferenceTalk.last)
  end

  test "should show conference_talk" do
    get conference_talk_url(@conference_talk)
    assert_response :success
  end

  test "should get edit" do
    get edit_conference_talk_url(@conference_talk)
    assert_response :success
  end

  test "should update conference_talk" do
    patch conference_talk_url(@conference_talk), params: { conference_talk: { bio: @conference_talk.bio, description: @conference_talk.description, speaker: @conference_talk.speaker, title: @conference_talk.title, track: @conference_talk.track } }
    assert_redirected_to conference_talk_url(@conference_talk)
  end

  test "should destroy conference_talk" do
    assert_difference("ConferenceTalk.count", -1) do
      delete conference_talk_url(@conference_talk)
    end

    assert_redirected_to conference_talks_url
  end
end
