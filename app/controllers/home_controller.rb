class HomeController < ApplicationController
	def landing
	end
	
	def welcome
	end

	def createbot_intro
	end

	def selectbot
	end

	def botsettings
		@id = params[:id]
		@bot = Bot.find_by(id: @id)
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
