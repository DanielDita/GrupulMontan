require 'test_helper'

class AlbumAttachmentsControllerTest < ActionController::TestCase
  setup do
    @album_attachment = album_attachments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:album_attachments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create album_attachment" do
    assert_difference('AlbumAttachment.count') do
      post :create, album_attachment: { album_id: @album_attachment.album_id, avatar: @album_attachment.avatar }
    end

    assert_redirected_to album_attachment_path(assigns(:album_attachment))
  end

  test "should show album_attachment" do
    get :show, id: @album_attachment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @album_attachment
    assert_response :success
  end

  test "should update album_attachment" do
    patch :update, id: @album_attachment, album_attachment: { album_id: @album_attachment.album_id, avatar: @album_attachment.avatar }
    assert_redirected_to album_attachment_path(assigns(:album_attachment))
  end

  test "should destroy album_attachment" do
    assert_difference('AlbumAttachment.count', -1) do
      delete :destroy, id: @album_attachment
    end

    assert_redirected_to album_attachments_path
  end
end
