class ActiveController < ApplicationController
	def updateactive
		@bot = Bot.find(params[:id])
		  if @bot.active == true
		    @bot.update(active: false)
		    @active_state = false
		    respond_to do |format|
			   format.js
		  	end
		  else
		  	@bot.update(active: true)
		    @active_state = true
		    respond_to do |format|
			   format.js
		  	end
		  end
	end
end