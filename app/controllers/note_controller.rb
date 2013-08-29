class NoteController < ApplicationController
  after_filter :pusher_trigger, only: %i[update]

  def update
    Note.raw = params[:note]
  end
end