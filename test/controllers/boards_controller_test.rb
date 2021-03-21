# frozen_string_literal: true

require_relative '../test_helper'

class BoardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @board = boards(:one)
  end

  test 'should get index' do
    get boards_url
    assert_redirected_to board_url(Board.first)
  end
end
