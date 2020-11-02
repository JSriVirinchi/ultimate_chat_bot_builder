class NodesController < ApplicationController
	def create
		@bot = Bot.find(params[:botid])
		@node = Node.create(node_type: params[:nodetype], bot_id: params[:botid], parent_id: params[:parentid])
		# redirect_to composemessage_path(@bot.id)
		respond_to do |format|
		    format.js
	  	end
	end

	def destroy
		@node = Node.find(params[:id])
		@node.destroy
		respond_to do |format|
		    format.js
	  	end
	end

	def message_create
		@message = Message.create(params.require(:message).permit(:text_messages, :node_type, :bot_id, :node_id))
		respond_to do |format|
		    format.js
	  	end
	end
end