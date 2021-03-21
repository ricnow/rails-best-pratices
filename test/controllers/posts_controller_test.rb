# frozen_string_literal: true

require_relative '../test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @board = boards(:one)
    @widget = PostsWidget.create!(name: 'Widget test', board: @board)
  end

  test 'should get new' do
    get new_posts_widget_post_path(@widget)
    assert_response :success
  end
end
