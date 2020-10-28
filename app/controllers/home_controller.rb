class HomeController < ApplicationController
	def landing
	end
	
	def welcome
	end

	def createbot_intro
	end

	def createbot_edit
		@id = params[:id]
		@bot = Bot.find_by(id: @id)
	end

	def createbot_update
		@id = params[:id]
		@bot = Bot.find_by(id: @id)
		 if @bot.update(params.require(:bot).permit(:name))
		 	flash[:notice]= "The bot was updated successfully"
		 	redirect_to botsettings_path(@bot.id)
		 else
		 	flash[:alert]= "The bot was not created"
		 	redirect_to botsettings_path(@bot.id)
		 end
	end

	def selectbot
	end

	def botsettings
		@id = params[:id]
		@bot = Bot.find_by(id: @id)
		@userbots= Bot.where(user_id: current_user.id)
	end

	def composemessage
		@id = params[:id]
		@bot = Bot.find(@id)
		
	end

	def activatebot
		@id = params[:id]
		@bot = Bot.find(@id)
	end

	def statistics
		@id = params[:id]
		@bot = Bot.find(@id)
	end
	
	def testbot
		@id = params[:id]
		@bot = Bot.find(@id)
	end
end
