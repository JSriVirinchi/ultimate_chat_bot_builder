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
		
		@bot = Bot.find(params[:id])
		if @bot.update(params.require(:botsettings).permit(:language, :initconv, :triggerpoint, :days))
			@bot.update(params.require(:bots).permit( :startdate, :enddate, :starttime, :endtime ))
			@bot.update(params.require(:date).permit(:rebootconv))
			flash[:notice]="successfully saved"
			redirect_to composemessage_path
		else
			flash[:alert]="not successfully saved"
			redirect_to composemessage_path
		end	
	end
end
