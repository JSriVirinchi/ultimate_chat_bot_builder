class NodesController < ApplicationController
	def create
		@bot = Bot.find(params[:botid])
		@node = Node.create(node_type: params[:nodetype], bot_id: params[:botid], parent_id: params[:parentid])
		# redirect_to composemessage_path(@bot.id)
		respond_to do |format|
		    format.js
	  	end
	end

	def update
		@bot = Bot.find(params[:bot_id])
		@node = Node.find(params[:node_id])
		@node.update(set_next_action: params[:set_next_action][:set_next_action], exit_message: params[:set_next_action][:exit_bot_message])
		respond_to do |format|
		    format.js
	  	end
	end

	def destroy
		@node = Node.find(params[:id])
		@node.destroy
		@node= nil;
		respond_to do |format|
		    format.js
	  	end
	end

	def message_create
		@bot = Bot.find(params[:message][:bot_id])
		@node = Node.find(params[:message][:node_id])
		@message = Message.create(params.require(:message).permit(:text_messages, :node_type, :bot_id, :node_id))
		respond_to do |format|
		    format.js
	  	end
	end

	def message_delete
		@bot = Bot.find(params[:bot_id])
		@node = Node.find(params[:node_id])
		@message = Message.find(params[:msg_id])
		@message.destroy
		respond_to do |format|
		    format.js
	  	end
	end

	def expand
		@bot = Bot.find(params[:bot_id])
		@node = Node.find(params[:node_id])
		respond_to do |format|
		    format.js
	  	end
	end

	def increment
		respond_to do |format|
		    format.js
	  	end
	end

	def decrement
		respond_to do |format|
		    format.js
	  	end
	end

	def add_number_of_nodes
		@bot = Bot.find(params[:botid])
		number = (params[:number_of_nodes][:number]).to_i
		for i in (1..number)
			@node = Node.create(node_type: params[:nodetype], bot_id: params[:botid], parent_id: params[:parentid])
		end
		@node = Node.find(params[:parentid]) 
		respond_to do |format|
		    format.js
	  	end
	end
	# private
	# def node_array
	# 	@length = 0;
	# 	Node.where(bot_id: @bot.id, parent_id: 0;).first.walk_tree do |node, level|
	# 	  @length = length + 1;
	# 	end
	# 	@NodeArray[1000];
	# end
end