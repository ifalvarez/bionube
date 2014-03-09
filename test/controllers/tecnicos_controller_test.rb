require 'test_helper'

class TecnicosControllerTest < ActionController::TestCase
  setup do
    @tecnico = tecnicos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tecnicos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tecnico" do
    assert_difference('Tecnico.count') do
      post :create, tecnico: { nombre: @tecnico.nombre }
    end

    assert_redirected_to tecnico_path(assigns(:tecnico))
  end

  test "should show tecnico" do
    get :show, id: @tecnico
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tecnico
    assert_response :success
  end

  test "should update tecnico" do
    patch :update, id: @tecnico, tecnico: { nombre: @tecnico.nombre }
    assert_redirected_to tecnico_path(assigns(:tecnico))
  end

  test "should destroy tecnico" do
    assert_difference('Tecnico.count', -1) do
      delete :destroy, id: @tecnico
    end

    assert_redirected_to tecnicos_path
  end
end
