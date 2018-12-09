require 'test_helper'

class FonctionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fonction = fonctions(:one)
  end

  test "should get index" do
    get fonctions_url
    assert_response :success
  end

  test "should get new" do
    get new_fonction_url
    assert_response :success
  end

  test "should create fonction" do
    assert_difference('Fonction.count') do
      post fonctions_url, params: { fonction: { etat: @fonction.etat, nom: @fonction.nom } }
    end

    assert_redirected_to fonction_url(Fonction.last)
  end

  test "should show fonction" do
    get fonction_url(@fonction)
    assert_response :success
  end

  test "should get edit" do
    get edit_fonction_url(@fonction)
    assert_response :success
  end

  test "should update fonction" do
    patch fonction_url(@fonction), params: { fonction: { etat: @fonction.etat, nom: @fonction.nom } }
    assert_redirected_to fonction_url(@fonction)
  end

  test "should destroy fonction" do
    assert_difference('Fonction.count', -1) do
      delete fonction_url(@fonction)
    end

    assert_redirected_to fonctions_url
  end
end
