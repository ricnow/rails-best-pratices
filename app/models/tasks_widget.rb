# frozen_string_literal: true

require 'net/http'

class TasksWidget < Widget
  def tasks
    url = URI.parse('http://localhost:3001/tasks')
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) do |http|
      http.request(req)
    end
    JSON.parse(res.body)[0..5]
  end
end
