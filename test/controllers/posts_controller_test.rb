require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  test "should get movie_title:string" do
    get :movie_title:string
    assert_response :success
  end

  test "should get url:string" do
    get :url:string
    assert_response :success
  end

  test "should get description:string" do
    get :description:string
    assert_response :success
  end

end
