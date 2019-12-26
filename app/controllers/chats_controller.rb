class ChatsController < ApplicationController
	def show
    @user = User.find(params[:id])
    room_id = current_user.user_rooms.pluck(:room_id)
    user_room = UserRoom.find_by(user_id: @user.id, room_id: room_id)

    unless user_room.nil?
      @room = user_room.room
    else
      @room = Room.new
      @room.save
      UserRoom.create(user_id: current_user.id, room_id: @room.id)
      UserRoom.create(user_id: @user.id, room_id: @room.id)
    end
    @chats = @room.chats
  end
end
