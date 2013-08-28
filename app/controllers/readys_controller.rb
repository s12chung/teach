class ReadysController < ApplicationController
  helper_method :pusher_channel

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

  protected
  def pusher_trigger
    Pusher.trigger(pusher_channel, "##{action_name}", nil)
  end

  def pusher_channel
    "teach"
  end
end
