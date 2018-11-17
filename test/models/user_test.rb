# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(
      name: 'konnor',
      email: 'konnor@example.com',
      password: 'example',
      password_confirmation: 'example'
    )
  end

  test 'name must not be blank' do
    @user.name = ' ' * 10
    assert_not @user.valid?
  end

  test 'name must be > 3' do
    @user.name = 'a' * 2
    assert_not @user.valid?
  end

  test 'name cannot be > 50' do
    @user.name = 'a' * 51
    assert_not @user.valid?
  end

  test 'name must be unique' do
    user2 = @user.dup
    @user.save
    assert_not user2.valid?
  end

  test 'good name' do
    assert @user.valid?
  end
end
