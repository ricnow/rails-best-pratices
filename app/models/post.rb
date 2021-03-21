# frozen_string_literal: true

class Post < ApplicationRecord
  validates :title, :body, presence: true

  belongs_to :widget

  before_create do |post|
    post.likes ||= 0
    post.avatar_name = %w[el_primo penny leon].sample
  end

  after_create :update_all_relevances

  def self.update_all_relevances
    Post.all.map(&:update_relevance!)
  end

  def update_all_relevances
    self.class.update_all_relevances
  end

  def update_relevance!
    self.relevance = likes * 100 / Post.sum(:likes).to_f
    self.relevance ||= 0
    save
  end
end
