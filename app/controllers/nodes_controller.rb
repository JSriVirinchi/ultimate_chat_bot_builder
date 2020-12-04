class NodesController < ApplicationController
	def create
		@bot = Bot.find(params[:botid])
		@node = Node.create(node_type: params[:nodetype], bot_id: params[:botid], parent_id: params[:parentid])
		@parent_id = params[:parentid]
		respond_to do |format|
		    format.js
	  	end
	end

	def update
		@bot = Bot.find(params[:bot_id])
		@node = Node.find(params[:node_id])
		@parent_id = @node.parent_id
		@node.update(set_next_action: params[:set_next_action][:set_next_action], 
			exit_message: params[:set_next_action][:exit_bot_message], 
			transfer_to_agent_message: params[:set_next_action][:transfer_to_agent_message],
			link_to_node_message: params[:set_next_action][:link_to_node_message])
		respond_to do |format|
		    format.js
	  	end
	end

	def destroy
		@node = Node.find(params[:id])
		@node_for_id = Node.find(params[:id])
		@parent_id = @node.parent_id
		@node.destroy
		@node= nil;
		respond_to do |format|
		    format.js
	  	end
	end

	def message_create
		@bot = Bot.find(params[:message][:bot_id])
		@node = Node.find(params[:message][:node_id])
		@parent_id = @node.parent_id
		@message = Message.create(params.require(:message).permit(:text_messages, :node_type, :bot_id, :node_id, :message_type))
		respond_to do |format|
		    format.js
	  	end
	end

	def nodes_message_attach_media
		@node = Node.find(params[:attach_message][:node_id])
		@bot = Bot.find(@node.bot_id)
		@parent_id = @node.parent_id
		@message = Message.new(params.require(:attach_message).permit(:image, :node_id, :node_type, :bot_id, :message_type))
		if @message.save
			respond_to do |format|
			    format.js 
		  	end
		else
		 	respond_to do |format|
			    format.js {flash.now[:alert] = "Upload only images"}
		  	end
		end  	
	end

	def nodes_message_attach_media_video
		@node = Node.find(params[:attach_video_message][:node_id])
		@bot = Bot.find(@node.bot_id)
		@parent_id = @node.parent_id
		@message = Message.new(params.require(:attach_video_message).permit(:video, :node_id, :node_type, :bot_id, :message_type))
		if @message.save
			respond_to do |format|
			    format.js 
		  	end
		else
		 	respond_to do |format|
			    format.js {flash.now[:alert] = "Upload only videos"}
		  	end
		end
	end

	def nodes_message_attach_media_pdf
		@node = Node.find(params[:attach_pdf_message][:node_id])
		@bot = Bot.find(@node.bot_id)
		@parent_id = @node.parent_id
		@message = Message.new(params.require(:attach_pdf_message).permit(:pdf, :node_id, :node_type, :bot_id, :message_type))
		if @message.save
			respond_to do |format|
			    format.js 
		  	end
		else
		 	respond_to do |format|
			    format.js {flash.now[:alert] = "Upload only PDF"}
		  	end
		end
	end

	def message_delete
		@bot = Bot.find(params[:bot_id])
		@node = Node.find(params[:node_id])
		@parent_id = @node.parent_id
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
		@node = Node.find(params[:node_id])
		respond_to do |format|
		    format.js
	  	end
	end

	def decrement
		@node = Node.find(params[:node_id])
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
	 	@position = params[:position]
	 	if @position == "expanded"
	 		@height_diff = 405;
	 	elsif @position == "define"
	 		@height_diff = 52; 
	 	elsif @position == "compressed"
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
		@child = Node.find(@id)
		@node = Node.find(@child.parent_id)
		respond_to do |format|
		    format.js
	  	end
	end

	def usermessage_options_form
		@id = params[:id]
		@child = Node.find(params[:id])
		@node = Node.find(@child.parent_id)
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

	def botmessage_name_edit
		@id = params[:id]
		respond_to do |format|
		    format.js
	 	end
	end

	def botmessage_name_update
		@id = params[:id]
		@node = Node.find(params[:id])
		@node.update(name: params[:name_edit][:name])
		respond_to do |format|
		    format.js
	 	end
	end

	def usermessage_expand
		@id = params[:id]
		@child = Node.find(@id)
		@node = Node.find(@child.parent_id)
		respond_to do |format|
		    format.js
	 	end
	end

	def usermessage_messages_create
		@child = Node.find(params[:messages][:node_id])
		@message = Message.create(params.require(:messages).permit(:text_messages, :node_type, :bot_id, :node_id))
		respond_to do |format|
		    format.js
	  	end
	end

	def usermessage_message_delete
		@bot = Bot.find(params[:bot_id])
		@child = Node.find(params[:node_id])
		@message = Message.find(params[:msg_id])
		@message.destroy
		respond_to do |format|
		    format.js
	  	end
	end

	def toggle_exit_message
		@node = Node.find(params[:id])
		@parent_id = @node.parent_id
		@bot_id= @node.bot_id
		@bot = Bot.find(@bot_id)
		  if @node.toggle_exit_message == true
		    @node.update(toggle_exit_message: false)
		    @toggle_exit_message_state = false
		    respond_to do |format|
			   format.js
		  	end
		  else
		  	@node.update(toggle_exit_message: true)
		    @toggle_exit_message_state = true
		    respond_to do |format|
			   format.js
		  	end
		  end
	end

	def toggle_transfer_to_agent_message
		@node = Node.find(params[:id])
		@parent_id = @node.parent_id
		@bot_id= @node.bot_id
		@bot = Bot.find(@bot_id)
		  if @node.toggle_transfer_to_agent_message == true
		    @node.update(toggle_transfer_to_agent_message: false)
		    @toggle_transfer_to_agent_message_state = false
		    respond_to do |format|
			   format.js
		  	end
		  else
		  	@node.update(toggle_transfer_to_agent_message: true)
		    @toggle_transfer_to_agent_message_state = true
		    respond_to do |format|
			   format.js
		  	end
		  end
	end

	def error_message_define_node
		@parent_id = params[:error_message_define][:parent_id]
		@error_node = Node.create(params.require(:error_message_define).permit(:node_type, :bot_id, :parent_id))
		@node = Node.find(@error_node.parent_id)
		@bot = Bot.find(@node.bot_id)
		respond_to do |format|
		   format.js
	  	end
	end

	def error_node_message_save
		@error_node = Node.find(params[:id])
		@parent = Node.find(@error_node.parent_id)
		@node = @parent
		@bot = Bot.find(@node.bot_id)
		if params[:message_id] == "default"
			@message = Message.create(node_type: "error", bot_id: @error_node.bot_id, node_id: @error_node.id, error_node: params[:error_node][:error_node],
				error_node_message: params[:error_node][:error_node_message], error_node_link_to_message: params[:error_node][:error_node_link_to_message],
				error_node_exit_message: params[:error_node][:error_node_exit_message], error_node_transfer_to_agent_message: params[:error_node][:error_node_transfer_to_agent_message],
				error_node_link_to_node: params[:error_node][:error_node_link_to_node])
		else
			@message = Message.find(params[:message_id])
			@message.update(error_node: params[:error_node][:error_node],
				error_node_message: params[:error_node][:error_node_message], error_node_link_to_message: params[:error_node][:error_node_link_to_message],
				error_node_exit_message: params[:error_node][:error_node_exit_message], error_node_transfer_to_agent_message: params[:error_node][:error_node_transfer_to_agent_message],
				error_node_link_to_node: params[:error_node][:error_node_link_to_node])
		end
		respond_to do |format|
		   format.js
	  	end
	end

	def error_message_expand_icon
		@node = Node.find(params[:node_id])
		@error_node = Node.where(node_type: "error", parent_id: @node.id).first
		respond_to do |format|
		   format.js
	  	end
	end

	def error_message_attempt_delete
		@error_message = Message.find(params[:message_id])
		@bot = Bot.find(@error_message.bot_id)
		@error_node = Node.find(@error_message.node_id)
		@node = Node.find(@error_node.parent_id)
		@error_message.destroy
		respond_to do |format|
		   format.js
	  	end
	end

	def error_node_save
		@error_node = Node.find(params[:node_id])
		@parent = Node.find(@error_node.parent_id)
		@node = @parent
		@bot = Bot.find(@node.bot_id)
		respond_to do |format|
		   format.js
	  	end
	end

	def error_node_add_another_error_attempt
		@error_node = Node.find(params[:node_id])
		respond_to do |format|
		   format.js
	  	end
	end

	def  error_node_editing_message
		@message = Message.find(params[:message_id])
		@error_node = Node.find(@message.node_id)
		respond_to do |format|
		   format.js
	  	end
	end

	def error_node_delete_icon_for_new_attempt
		@error_node = Node.find(params[:error_node_id])
		respond_to do |format|
		   format.js
	  	end
	end

	def add_a_new_text_message_button
		@node = Node.find(params[:node_id])
		respond_to do |format|
		   format.js
	  	end
	end
end