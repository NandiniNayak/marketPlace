require 'test_helper'

class ItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item = items(:one)
  end

  test "should get index" do
    get items_url
    assert_response :success
  end

  test "should get new" do
    get new_item_url
    assert_response :success
  end

  test "should create item" do
    assert_difference('Item.count') do
      post items_url, params: { item: { breed_id: @item.breed_id, city: @item.city, date_of_birth: @item.date_of_birth, deposit: @item.deposit, description: @item.description, diet: @item.diet, price: @item.price, sex: @item.sex, state: @item.state, title: @item.title } }
    end

    assert_redirected_to item_url(Item.last)
  end

  test "should show item" do
    get item_url(@item)
    assert_response :success
  end

  test "should get edit" do
    get edit_item_url(@item)
    assert_response :success
  end

  test "should update item" do
    patch item_url(@item), params: { item: { breed_id: @item.breed_id, city: @item.city, date_of_birth: @item.date_of_birth, deposit: @item.deposit, description: @item.description, diet: @item.diet, price: @item.price, sex: @item.sex, state: @item.state, title: @item.title } }
    assert_redirected_to item_url(@item)
  end

  test "should destroy item" do
    assert_difference('Item.count', -1) do
      delete item_url(@item)
    end

    assert_redirected_to items_url
  end
end
