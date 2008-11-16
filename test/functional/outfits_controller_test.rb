require 'test_helper'

class OutfitsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:outfits)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_outfit
    assert_difference('Outfit.count') do
      post :create, :outfit => { }
    end

    assert_redirected_to outfit_path(assigns(:outfit))
  end

  def test_should_show_outfit
    get :show, :id => outfits(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => outfits(:one).id
    assert_response :success
  end

  def test_should_update_outfit
    put :update, :id => outfits(:one).id, :outfit => { }
    assert_redirected_to outfit_path(assigns(:outfit))
  end

  def test_should_destroy_outfit
    assert_difference('Outfit.count', -1) do
      delete :destroy, :id => outfits(:one).id
    end

    assert_redirected_to outfits_path
  end
end
