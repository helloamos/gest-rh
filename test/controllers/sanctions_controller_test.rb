require 'test_helper'

class SanctionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sanction = sanctions(:one)
  end

  test "should get index" do
    get sanctions_url
    assert_response :success
  end

  test "should get new" do
    get new_sanction_url
    assert_response :success
  end

  test "should create sanction" do
    assert_difference('Sanction.count') do
      post sanctions_url, params: { sanction: { cause: @sanction.cause, duree_sanction: @sanction.duree_sanction, matricule_employe: @sanction.matricule_employe, type_sanction: @sanction.type_sanction } }
    end

    assert_redirected_to sanction_url(Sanction.last)
  end

  test "should show sanction" do
    get sanction_url(@sanction)
    assert_response :success
  end

  test "should get edit" do
    get edit_sanction_url(@sanction)
    assert_response :success
  end

  test "should update sanction" do
    patch sanction_url(@sanction), params: { sanction: { cause: @sanction.cause, duree_sanction: @sanction.duree_sanction, matricule_employe: @sanction.matricule_employe, type_sanction: @sanction.type_sanction } }
    assert_redirected_to sanction_url(@sanction)
  end

  test "should destroy sanction" do
    assert_difference('Sanction.count', -1) do
      delete sanction_url(@sanction)
    end

    assert_redirected_to sanctions_url
  end
end
