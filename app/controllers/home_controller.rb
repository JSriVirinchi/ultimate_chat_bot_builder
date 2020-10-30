class HomeController < ApplicationController
	def landing
	end
	
	def welcome
	end

	def createbot_intro
	end

	def createbotedit
		@id = params[:id]
		@bot = Bot.find_by(id: @id)
		respond_to do |format|
			format.js
		end
	end


	def createbotupdate
		@id = params[:id]
		@bot = Bot.find_by(id: @id)
		@bot.update(params.require(:bot).permit(:name))
	 	respond_to do |format|
			format.js
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
