class BotsController < ApplicationController
	def create
		@bot = Bot.new(params.require(:bot).permit(:name).merge(user_id: current_user.id))
		if @bot.save
			flash[:notice]= "The bot was created successfully"
			redirect_to botsettings_path
		else
			flash[:alert]= "Bot was not created"
			redirect_to createbot_intro_path
		end	
	end

	def update
		redirect_to composemessage_path
	end
end
