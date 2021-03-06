class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :pusher_channel

  protected
  def pusher_trigger
    Pusher.trigger(pusher_channel, "#{controller_name}##{action_name}", { readys_size: Ready.all.size })
  end

  def pusher_channel
    "teach"
  end
end