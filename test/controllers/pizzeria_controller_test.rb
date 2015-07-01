require 'test_helper'

class PizzeriasControllerTest < ActionController::TestCase
  setup do
    @pizzeria = pizzerias(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pizzerias)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pizzeria" do
    assert_difference('Pizzeria.count') do
      post :create, pizzeria: { description: @pizzeria.description, owner: @pizzeria.owner, address: @pizzeria.address, phone: @pizzeria.phone, name: @pizzeria.name }
    end

    assert_redirected_to pizzeria_path(assigns(:pizzeria))
  end

  test "should show pizzeria" do
    get :show, id: @pizzeria
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pizzeria
    assert_response :success
  end

  test "should update pizzeria" do
    patch :update, id: @pizzeria, pizzeria: { description: @pizzeria.description, owner: @pizzeria.owner, address: @pizzeria.address, phone: @pizzeria.phone, name: @pizzeria.name }
    assert_redirected_to pizzeria_path(assigns(:pizzeria))
  end

  test "should destroy pizzeria" do
    assert_difference('Pizzeria.count', -1) do
      delete :destroy, id: @pizzeria
    end

    assert_redirected_to pizzerias_path
  end
end
