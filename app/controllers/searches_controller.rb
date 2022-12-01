class SearchesController < ApplicationController
  before_action :set_search

  def index; end

  protected

  def set_search
    # group searches by query and count them
    @limit = 100
    @time_range = 1.weeks.ago..Time.now
    @searches = Search.where(created_at: @time_range).group(:query).limit(20).order('query asc').limit(@limit).count
  end
end
