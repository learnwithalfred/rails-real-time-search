class LogSearchJob < ApplicationJob
  queue_as :default

  def perform(search, count, ip)
    Search.create!(query: search, results_count: count, ip_address: ip)
  end
end
