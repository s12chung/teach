class ReadysController < ApplicationController
  READY_COUNT_KEY = 'ready_count'

  def new
  end

  def create
    self.ready_count += 1
    puts ready_count
  end

  protected
  def ready_count
    @ready_count ||= Rails.cache.read(READY_COUNT_KEY) || 0
  end

  def ready_count=(ready_count)
    Rails.cache.write(READY_COUNT_KEY, ready_count)
  end
end
