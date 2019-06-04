require 'test_helper'

class AlumnoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get alumno_index_url
    assert_response :success
  end

  test "should get datos" do
    get alumno_datos_url
    assert_response :success
  end

  test "should get examen" do
    get alumno_examen_url
    assert_response :success
  end

end
