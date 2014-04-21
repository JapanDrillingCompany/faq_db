require 'test_helper'

class Publicity::QasControllerTest < ActionController::TestCase
  setup do
    @publicity_qa = publicity_qas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:publicity_qas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create publicity_qa" do
    assert_difference('Publicity::Qa.count') do
      post :create, publicity_qa: { answer: @publicity_qa.answer, category1: @publicity_qa.category1, category2: @publicity_qa.category2, category_type_id: @publicity_qa.category_type_id, classification_type_id: @publicity_qa.classification_type_id, note: @publicity_qa.note, question: @publicity_qa.question, rate: @publicity_qa.rate, reffile_content_type: @publicity_qa.reffile_content_type, reffile_file_name: @publicity_qa.reffile_file_name, reffile_file_size: @publicity_qa.reffile_file_size, reffile_updated_at: @publicity_qa.reffile_updated_at, user_id: @publicity_qa.user_id }
    end

    assert_redirected_to publicity_qa_path(assigns(:publicity_qa))
  end

  test "should show publicity_qa" do
    get :show, id: @publicity_qa
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @publicity_qa
    assert_response :success
  end

  test "should update publicity_qa" do
    put :update, id: @publicity_qa, publicity_qa: { answer: @publicity_qa.answer, category1: @publicity_qa.category1, category2: @publicity_qa.category2, category_type_id: @publicity_qa.category_type_id, classification_type_id: @publicity_qa.classification_type_id, note: @publicity_qa.note, question: @publicity_qa.question, rate: @publicity_qa.rate, reffile_content_type: @publicity_qa.reffile_content_type, reffile_file_name: @publicity_qa.reffile_file_name, reffile_file_size: @publicity_qa.reffile_file_size, reffile_updated_at: @publicity_qa.reffile_updated_at, user_id: @publicity_qa.user_id }
    assert_redirected_to publicity_qa_path(assigns(:publicity_qa))
  end

  test "should destroy publicity_qa" do
    assert_difference('Publicity::Qa.count', -1) do
      delete :destroy, id: @publicity_qa
    end

    assert_redirected_to publicity_qas_path
  end
end
