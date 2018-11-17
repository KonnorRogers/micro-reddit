# frozen_string_literal: true

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @user = User.create(name: 'konnor', email: 'example@example.com',
                        password: 'example', password_confirmation: 'example')
    @post = Post.new(title: 'title', text: 'text', user_id: @user.id)
  end

  test 'title cannot be blank' do
    @post.title = ' ' * 10
    assert_not @post.valid?
  end

  test 'text cannot be blank' do
    @post.text = ' ' * 10
    assert_not @post.valid?
  end

  test 'post must have a user in the database' do
    @post.user_id = 0
    assert_not @post.valid?
  end

  test 'post is valid' do
    assert @post.valid?
  end
end
