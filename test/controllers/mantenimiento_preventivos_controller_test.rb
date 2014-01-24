require 'test_helper'

class MantenimientoPreventivosControllerTest < ActionController::TestCase
  setup do
    @mantenimiento_preventivo = mantenimiento_preventivos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mantenimiento_preventivos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mantenimiento_preventivo" do
    assert_difference('MantenimientoPreventivo.count') do
      post :create, mantenimiento_preventivo: { fecha: @mantenimiento_preventivo.fecha, reporte: @mantenimiento_preventivo.reporte }
    end

    assert_redirected_to mantenimiento_preventivo_path(assigns(:mantenimiento_preventivo))
  end

  test "should show mantenimiento_preventivo" do
    get :show, id: @mantenimiento_preventivo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mantenimiento_preventivo
    assert_response :success
  end

  test "should update mantenimiento_preventivo" do
    patch :update, id: @mantenimiento_preventivo, mantenimiento_preventivo: { fecha: @mantenimiento_preventivo.fecha, reporte: @mantenimiento_preventivo.reporte }
    assert_redirected_to mantenimiento_preventivo_path(assigns(:mantenimiento_preventivo))
  end

  test "should destroy mantenimiento_preventivo" do
    assert_difference('MantenimientoPreventivo.count', -1) do
      delete :destroy, id: @mantenimiento_preventivo
    end

    assert_redirected_to mantenimiento_preventivos_path
  end
end
