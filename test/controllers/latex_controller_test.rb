require 'test_helper'

class LatexControllerTest < ActionController::TestCase
  setup do
    @latex = latex(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:latex)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create latex" do
    assert_difference('Latex.count') do
      post :create, latex: {  }
    end

    assert_redirected_to latex_path(assigns(:latex))
  end

  test "should show latex" do
    get :show, id: @latex
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @latex
    assert_response :success
  end

  test "should update latex" do
    patch :update, id: @latex, latex: {  }
    assert_redirected_to latex_path(assigns(:latex))
  end

  test "should destroy latex" do
    assert_difference('Latex.count', -1) do
      delete :destroy, id: @latex
    end

    assert_redirected_to latex_index_path
  end
end
