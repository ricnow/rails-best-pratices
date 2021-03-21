# frozen_string_literal: true

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  setup do
    @board = boards(:one)
    @widget = PostsWidget.create!(name: 'Widget test', board: @board)
  end

  test 'like is never null' do
    post = Post.create!(title: 'Some title', body: 'Some body', widget: @widget)

    assert_equal 0, post.likes
  end
end
