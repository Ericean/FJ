require 'test_helper'

class WordImagesControllerTest < ActionController::TestCase
  setup do
    @word_image = word_images(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:word_images)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create word_image" do
    assert_difference('WordImage.count') do
      post :create, word_image: { name: @word_image.name, url: @word_image.url }
    end

    assert_redirected_to word_image_path(assigns(:word_image))
  end

  test "should show word_image" do
    get :show, id: @word_image
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @word_image
    assert_response :success
  end

  test "should update word_image" do
    patch :update, id: @word_image, word_image: { name: @word_image.name, url: @word_image.url }
    assert_redirected_to word_image_path(assigns(:word_image))
  end

  test "should destroy word_image" do
    assert_difference('WordImage.count', -1) do
      delete :destroy, id: @word_image
    end

    assert_redirected_to word_images_path
  end
end
