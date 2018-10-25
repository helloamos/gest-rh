require 'test_helper'

class AvancementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @avancement = avancements(:one)
  end

  test "should get index" do
    get avancements_url
    assert_response :success
  end

  test "should get new" do
    get new_avancement_url
    assert_response :success
  end

  test "should create avancement" do
    assert_difference('Avancement.count') do
      post avancements_url, params: { avancement: { date_avancement: @avancement.date_avancement, matricule_employe: @avancement.matricule_employe } }
    end

    assert_redirected_to avancement_url(Avancement.last)
  end

  test "should show avancement" do
    get avancement_url(@avancement)
    assert_response :success
  end

  test "should get edit" do
    get edit_avancement_url(@avancement)
    assert_response :success
  end

  test "should update avancement" do
    patch avancement_url(@avancement), params: { avancement: { date_avancement: @avancement.date_avancement, matricule_employe: @avancement.matricule_employe } }
    assert_redirected_to avancement_url(@avancement)
  end

  test "should destroy avancement" do
    assert_difference('Avancement.count', -1) do
      delete avancement_url(@avancement)
    end

    assert_redirected_to avancements_url
  end
end
