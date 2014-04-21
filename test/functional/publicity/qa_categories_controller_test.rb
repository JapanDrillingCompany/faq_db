require 'test_helper'

class Publicity::QaCategoriesControllerTest < ActionController::TestCase
  setup do
    @publicity_qa_category = publicity_qa_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:publicity_qa_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create publicity_qa_category" do
    assert_difference('Publicity::QaCategory.count') do
      post :create, publicity_qa_category: { name: @publicity_qa_category.name }
    end

    assert_redirected_to publicity_qa_category_path(assigns(:publicity_qa_category))
  end

  test "should show publicity_qa_category" do
    get :show, id: @publicity_qa_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @publicity_qa_category
    assert_response :success
  end

  test "should update publicity_qa_category" do
    put :update, id: @publicity_qa_category, publicity_qa_category: { name: @publicity_qa_category.name }
    assert_redirected_to publicity_qa_category_path(assigns(:publicity_qa_category))
  end

  test "should destroy publicity_qa_category" do
    assert_difference('Publicity::QaCategory.count', -1) do
      delete :destroy, id: @publicity_qa_category
    end

    assert_redirected_to publicity_qa_categories_path
  end
end
