class ReadysController < ApplicationController
  after_filter :pusher_trigger, only: %i[reset create destroy]

  def index
    @readys = Ready.all
  end

  def reset
    Ready.delete_all
    redirect_to readys_path
  end

  def new
  end

  def create
    Ready.add
    redirect_to root_path
  end

  def destroy
    Ready.delete
    redirect_to root_path
  end
end
