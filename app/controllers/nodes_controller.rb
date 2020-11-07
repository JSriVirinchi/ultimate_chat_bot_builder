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

	def usermessage_node_delete
	 	@node = Node.find(params[:id])
	 	position = params[:position]
	 	if position == "expanded"
	 		@height_diff = 405;
	 	elsif position == "define"
	 		@height_diff = 52; 
	 	elsif position == "compressed"
	 		@height_diff = 108;
	 	end
	 	
	 	@parent_id = @node.parent_id
	 	@node.destroy
	 	@node = Node.find(@parent_id)
	 	@number_of_children = 0 

	 	for i in @node.children
	 		@number_of_children = @number_of_children + 1
	 	end

		respond_to do |format|
		    format.js
	  	end
	end

	def define_nodes
		@id = params[:id]
		respond_to do |format|
		    format.js
	  	end
	end

	def usermessage_options_form
		@id = params[:id]
		@child = Node.find(params[:id])
		@child.update(user_input_type: params[:child_options][:user_input_type])
		respond_to do |format|
		    format.js
	 	end
	end

	def usermessage_name_edit
		@id = params[:id]
		respond_to do |format|
		    format.js
	 	end
	end

	def usermessage_name_update
		@id = params[:id]
		@child = Node.find(params[:id])
		@child.update(name: params[:name_edit][:name])
		respond_to do |format|
		    format.js
	 	end
	end

	def usermessage_expand
		@id = params[:id]
		respond_to do |format|
		    format.js
	 	end
	end
end