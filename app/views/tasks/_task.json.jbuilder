# frozen_string_literal: true

json.extract! task, :id, :title, :location, :scheduled_to, :task_type, :created_at, :updated_at
json.url task_url(task, format: :json)
