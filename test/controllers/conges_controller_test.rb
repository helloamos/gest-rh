require 'test_helper'

class CongesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @conge = conges(:one)
  end

  test "should get index" do
    get conges_url
    assert_response :success
  end

  test "should get new" do
    get new_conge_url
    assert_response :success
  end

  test "should create conge" do
    assert_difference('Conge.count') do
      post conges_url, params: { conge: { cause: @conge.cause, date_debut: @conge.date_debut, matricule_employe_id: @conge.matricule_employe_id, type_conge_id: @conge.type_conge_id } }
    end

    assert_redirected_to conge_url(Conge.last)
  end

  test "should show conge" do
    get conge_url(@conge)
    assert_response :success
  end

  test "should get edit" do
    get edit_conge_url(@conge)
    assert_response :success
  end

  test "should update conge" do
    patch conge_url(@conge), params: { conge: { cause: @conge.cause, date_debut: @conge.date_debut, matricule_employe_id: @conge.matricule_employe_id, type_conge_id: @conge.type_conge_id } }
    assert_redirected_to conge_url(@conge)
  end

  test "should destroy conge" do
    assert_difference('Conge.count', -1) do
      delete conge_url(@conge)
    end

    assert_redirected_to conges_url
  end
end
