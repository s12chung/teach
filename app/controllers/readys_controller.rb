class ReadysController < ApplicationController
  READY_COUNT_KEY = 'ready_count'
  def new
  end

  def create
    @ready_count = Rails.cache.read(READY_COUNT_KEY) || 0
    @ready_count += 1
    Rails.cache.write(READY_COUNT_KEY, @ready_count)
    puts @ready_count
  end
end
