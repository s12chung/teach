class ReadysController < ApplicationController
  READY_COUNT_KEY = 'ready_count'

  helper_method :ready_count

  def index
  end

  def reset
    self.ready_count = 0
    redirect_to readys_path
  end

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
