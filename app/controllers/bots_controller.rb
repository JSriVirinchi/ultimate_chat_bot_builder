class BotsController < ApplicationController
	def create
		@bot = Bot.new(params.require(:bot).permit(:name).merge(user_id: current_user.id))
		if @bot.save
			flash[:notice]= "The bot was created successfully"
			bot= Bot.where( user_id: current_user.id).last
			@id= bot.id
			redirect_to botsettings_path(@id)
		else
			flash[:alert]= "Bot was not created"
			redirect_to createbot_intro_path
		end	
	end

	def update
		@bot = Bot.find(params[:id])
		if params[:botsettingsphone]
			@bot.update(params.require(:botsettingsphone).permit(:phone))
		end
		if params[:botsettingslanguage]
			@bot.update(language: params[:button])
		end
		if params[:botsettingsstarter]
			@bot.update(initconv: params[:button])
			if @bot.initconv == "Bot"
				for triggerphrases in Triggerphrase.where(bot_id: @bot.id)
					triggerphrases.destroy
				end
			end 
		end
		if params[:botsettingstrigger]
			if @bot.triggerpoint == "Trigger"
				if params[:button] == "Default"
					for triggerphrases in Triggerphrase.where(bot_id: @bot.id)
						triggerphrases.destroy
					end
				end
			end
			@bot.update(triggerpoint: params[:button])
		end
		if params[:botsettingssetreminder]
			@bot.update(reminder: params[:button])
		end
		if params[:conversation]
			@bot.update(conversation: params[:button])
		end
		
		respond_to do |format|
			format.js
		end
	end


	def destroy
		id = params[:id]
		@bot = Bot.find(params[:id])
		if @bot.destroy
			flash[:notice]= "Successfully deleted"
			redirect_to root_path
		else
			flash[:alert]="Not successfully deleted"
			redirect_to root_path
		end
	end
end
