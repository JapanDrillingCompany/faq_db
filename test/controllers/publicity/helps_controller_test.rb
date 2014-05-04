require 'test_helper'

class Publicity::HelpsControllerTest < ActionController::TestCase
  setup do
    @publicity_help = publicity_helps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:publicity_helps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create publicity_help" do
    assert_difference('Publicity::Help.count') do
      post :create, publicity_help: { content: @publicity_help.content, title: @publicity_help.title }
    end

    assert_redirected_to publicity_help_path(assigns(:publicity_help))
  end

  test "should show publicity_help" do
    get :show, id: @publicity_help
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @publicity_help
    assert_response :success
  end

  test "should update publicity_help" do
    patch :update, id: @publicity_help, publicity_help: { content: @publicity_help.content, title: @publicity_help.title }
    assert_redirected_to publicity_help_path(assigns(:publicity_help))
  end

  test "should destroy publicity_help" do
    assert_difference('Publicity::Help.count', -1) do
      delete :destroy, id: @publicity_help
    end

    assert_redirected_to publicity_helps_path
  end
end
