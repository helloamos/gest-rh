require 'test_helper'

class TypeSanctionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @type_sanction = type_sanctions(:one)
  end

  test "should get index" do
    get type_sanctions_url
    assert_response :success
  end

  test "should get new" do
    get new_type_sanction_url
    assert_response :success
  end

  test "should create type_sanction" do
    assert_difference('TypeSanction.count') do
      post type_sanctions_url, params: { type_sanction: { description: @type_sanction.description, etat: @type_sanction.etat, nom: @type_sanction.nom } }
    end

    assert_redirected_to type_sanction_url(TypeSanction.last)
  end

  test "should show type_sanction" do
    get type_sanction_url(@type_sanction)
    assert_response :success
  end

  test "should get edit" do
    get edit_type_sanction_url(@type_sanction)
    assert_response :success
  end

  test "should update type_sanction" do
    patch type_sanction_url(@type_sanction), params: { type_sanction: { description: @type_sanction.description, etat: @type_sanction.etat, nom: @type_sanction.nom } }
    assert_redirected_to type_sanction_url(@type_sanction)
  end

  test "should destroy type_sanction" do
    assert_difference('TypeSanction.count', -1) do
      delete type_sanction_url(@type_sanction)
    end

    assert_redirected_to type_sanctions_url
  end
end
