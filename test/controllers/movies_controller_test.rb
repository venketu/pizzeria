require 'test_helper'

class PizzariasControllerTest < ActionController::TestCase
  setup do
    @pizzaria = pizzarias(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pizzarias)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pizzaria" do
    assert_difference('Pizzaria.count') do
      post :create, pizzaria: { description: @pizzaria.description, owner: @pizzaria.owner, founded: @pizzaria.founded, rating: @pizzaria.rating, name: @pizzaria.name }
    end

    assert_redirected_to pizzaria_path(assigns(:pizzaria))
  end

  test "should show pizzaria" do
    get :show, id: @pizzaria
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pizzaria
    assert_response :success
  end

  test "should update pizzaria" do
    patch :update, id: @pizzaria, pizzaria: { description: @pizzaria.description, owner: @pizzaria.owner, founded: @pizzaria.founded, rating: @pizzaria.rating, name: @pizzaria.name }
    assert_redirected_to pizzaria_path(assigns(:pizzaria))
  end

  test "should destroy pizzaria" do
    assert_difference('Pizzaria.count', -1) do
      delete :destroy, id: @pizzaria
    end

    assert_redirected_to pizzarias_path
  end
end
