require 'test_helper'

class DemissionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @demission = demissions(:one)
  end

  test "should get index" do
    get demissions_url
    assert_response :success
  end

  test "should get new" do
    get new_demission_url
    assert_response :success
  end

  test "should create demission" do
    assert_difference('Demission.count') do
      post demissions_url, params: { demission: { date_demission: @demission.date_demission, etat: @demission.etat, matricule_employe: @demission.matricule_employe } }
    end

    assert_redirected_to demission_url(Demission.last)
  end

  test "should show demission" do
    get demission_url(@demission)
    assert_response :success
  end

  test "should get edit" do
    get edit_demission_url(@demission)
    assert_response :success
  end

  test "should update demission" do
    patch demission_url(@demission), params: { demission: { date_demission: @demission.date_demission, etat: @demission.etat, matricule_employe: @demission.matricule_employe } }
    assert_redirected_to demission_url(@demission)
  end

  test "should destroy demission" do
    assert_difference('Demission.count', -1) do
      delete demission_url(@demission)
    end

    assert_redirected_to demissions_url
  end
end
