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
		@bot = Bot.where( user_id: current_user.id).last
	end

	def composemessage
		@bot = Bot.where( user_id: current_user.id).last
	end

	def activatebot
		@bot = Bot.where( user_id: current_user.id).last
	end
end
