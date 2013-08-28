class ReadysController < ApplicationController
  helper_method :pusher_channel

  def index
    @readys = Ready.all
  end

  def reset
    Ready.delete_all
    Pusher.trigger(pusher_channel, "#reset", nil)

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

  protected
  def pusher_channel
    "teach"
  end
end
