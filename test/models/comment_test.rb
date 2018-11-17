require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def setup
    @user = User.create(name: 'konnor', email: 'example@example.com',
                        password: 'example', password_confirmation: 'example')
    @post = Post.create(title: 'title', text: 'post_title', user_id: @user.id)
    @comment = Comment.new(text: 'comment', user_id: @user.id, post_id: @post.id)
  end

  test 'valid comment' do
    assert @comment.valid?
  end

  test 'comment must not be blank' do
    @comment.text = ' ' * 10
    assert_not @comment.valid?
  end

  test 'user_id must exist' do
    @comment.user_id = 0
    assert_not @comment.valid?
  end

  test 'post_id must exist' do
    @comment.post_id = 0
    assert_not @comment.valid?
  end
end
