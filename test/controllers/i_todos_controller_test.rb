require "test_helper"

class ITodoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get i_todo_index_url
    assert_response :success
  end
end
