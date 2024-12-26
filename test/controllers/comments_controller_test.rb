require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
    @comment_params = { comment: { content: "This is a test comment" } }
  end

  test "should create comment" do
    assert_difference("Comment.count") do
      post post_comments_url(@post), params: @comment_params
    end

    assert_redirected_to post_url(@post)
  end

  test "should not create comment with invalid params" do
    assert_no_difference("Comment.count") do
      post post_comments_url(@post), params: { comment: { content: "" } }
    end

    assert_response :unprocessable_entity
  end
end
