class ChatController < ApplicationController

  def post
    @chat = Chat.create(:sender_id => params[:sender_id], :sender_name=> params[:sender_name], :text=>params[:text])
    respond_to do |format|
      format.json {render json: @chat}
    end
  end

  def get
    @chat = Chat.where("id > ?", params[:last_id]).limit(100)
    respond_to do |format|
      format.json {render json: @chat}
    end
  end
end
