# frozen_string_literal: true

class PostsWidget < Widget
  has_many :posts, foreign_key: :widget_id
end
