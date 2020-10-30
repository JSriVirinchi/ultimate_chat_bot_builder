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

	def triggerphraseedit
		@bot = Bot.find(params[:id])
		respond_to do |format|
		   format.js
	  	end
	end

	def triggerphraseconfirm
		@bot = Bot.find(params[:id])
		respond_to do |format|
		   format.js
	  	end
	end

	def triggerphrasecreate
		@bot = Bot.find(params[:id])
		@triggerphrase = Triggerphrase.new(params.require(:triggerphrase).permit(:triggerphrase).merge(bot_id: @bot.id))
		@triggerphrase.save
		# redirect_to composemessage_path(@bot.id)
		respond_to do |format|
			format.js
	  	end
	end

	def triggerphrasedelete
		@bot = Bot.find(params[:botid])
		@triggerphrase = Triggerphrase.find(params[:id])
		@triggerphrase.destroy
		# redirect_to composemessage_path(@bot.id)
		respond_to do |format|
			format.js
	  	end
	end
	
end