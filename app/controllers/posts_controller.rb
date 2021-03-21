# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i[edit update increase_like]
  before_action :set_widget

  def new
    @post = Post.new
  end

  def edit; end

  def create
    @post = Post.new(post_params)
    @post.widget = @widget

    if @post.save
      redirect_to @widget.board, notice: 'Post was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @widget.board, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def increase_like
    @post.increment!(:likes)
    # Post.update_all_relevances

    respond_to do |format|
      format.js { render layout: false } # Add this line to you respond_to block
    end
  end

  private

  def set_widget
    @widget = Widget.find(params[:posts_widget_id])
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :status)
  end
end
