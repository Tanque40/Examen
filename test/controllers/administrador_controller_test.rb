require 'test_helper'

class AdministradorControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get administrador_index_url
    assert_response :success
  end

  test "should get welcome" do
    get administrador_welcome_url
    assert_response :success
  end

  test "should get alumnos" do
    get administrador_alumnos_url
    assert_response :success
  end

  test "should get secciones" do
    get administrador_secciones_url
    assert_response :success
  end

  test "should get preguntas" do
    get administrador_preguntas_url
    assert_response :success
  end

  test "should get calificar" do
    get administrador_calificar_url
    assert_response :success
  end

  test "should get resultados" do
    get administrador_resultados_url
    assert_response :success
  end

end
