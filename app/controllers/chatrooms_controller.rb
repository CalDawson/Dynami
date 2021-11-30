class ChatroomsController < ApplicationController
  def index
    @chatrooms = policy_scope(Chatroom)
    @other_users = current_user.not_messaged
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    authorize @chatroom
  end

  def create
    chatroom = Chatroom.new
    chatroom.user1 = current_user
    chatroom.user2 = User.find(params[:user_id])
    authorize chatroom
    chatroom.save
    redirect_to chatroom_path(chatroom)
  end
end
