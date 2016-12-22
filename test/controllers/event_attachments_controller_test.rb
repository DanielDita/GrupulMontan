require 'test_helper'

class EventAttachmentsControllerTest < ActionController::TestCase
  setup do
    @event_attachment = event_attachments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:event_attachments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event_attachment" do
    assert_difference('EventAttachment.count') do
      post :create, event_attachment: { picture: @event_attachment.picture, post_id: @event_attachment.post_id }
    end

    assert_redirected_to event_attachment_path(assigns(:event_attachment))
  end

  test "should show event_attachment" do
    get :show, id: @event_attachment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event_attachment
    assert_response :success
  end

  test "should update event_attachment" do
    patch :update, id: @event_attachment, event_attachment: { picture: @event_attachment.picture, post_id: @event_attachment.post_id }
    assert_redirected_to event_attachment_path(assigns(:event_attachment))
  end

  test "should destroy event_attachment" do
    assert_difference('EventAttachment.count', -1) do
      delete :destroy, id: @event_attachment
    end

    assert_redirected_to event_attachments_path
  end
end
