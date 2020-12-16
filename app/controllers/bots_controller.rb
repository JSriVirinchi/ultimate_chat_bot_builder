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
		if @bot.update(params.require(:botsettings).permit(:language, :initconv, :triggerpoint, :days))
			@bot.update(params.require(:date).permit(:rebootconv))

			flash[:notice]="Successfully saved"
			redirect_to composemessage_path
		else
			flash[:alert]="Not successfully saved"
			redirect_to botsettings_path
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
