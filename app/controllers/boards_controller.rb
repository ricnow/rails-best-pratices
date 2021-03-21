# frozen_string_literal: true

class BoardsController < ApplicationController
  before_action :set_board, only: %i[show]

  def index
    redirect_to Board.first
  end

  def show
    @widgets = @board.widgets
  end

  private

  def set_board
    @board = Board.find(params[:id])
  end

  def board_params
    params.require(:board).permit(:name)
  end
end
