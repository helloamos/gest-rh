require 'test_helper'

class TypeCongesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @type_conge = type_conges(:one)
  end

  test "should get index" do
    get type_conges_url
    assert_response :success
  end

  test "should get new" do
    get new_type_conge_url
    assert_response :success
  end

  test "should create type_conge" do
    assert_difference('TypeConge.count') do
      post type_conges_url, params: { type_conge: { name: @type_conge.name } }
    end

    assert_redirected_to type_conge_url(TypeConge.last)
  end

  test "should show type_conge" do
    get type_conge_url(@type_conge)
    assert_response :success
  end

  test "should get edit" do
    get edit_type_conge_url(@type_conge)
    assert_response :success
  end

  test "should update type_conge" do
    patch type_conge_url(@type_conge), params: { type_conge: { name: @type_conge.name } }
    assert_redirected_to type_conge_url(@type_conge)
  end

  test "should destroy type_conge" do
    assert_difference('TypeConge.count', -1) do
      delete type_conge_url(@type_conge)
    end

    assert_redirected_to type_conges_url
  end
end
