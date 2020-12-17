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
		if params[:triggerphrase]
			@bot = Bot.find(params[:id])
			@triggerphrase = Triggerphrase.new(params.require(:triggerphrase).permit(:triggerphrase).merge(bot_id: @bot.id))
			@triggerphrase.save			
		end
		if params[:botsettings_triggerphrase]
			@bot = Bot.find(params[:id])
			@triggerphrase = Triggerphrase.new(params.require(:botsettings_triggerphrase).permit(:triggerphrase).merge(bot_id: @bot.id))
			@triggerphrase.save	
		end  
		respond_to do |format|
			format.js
	  	end	
	end

	def triggerphrasedelete
		@bot = Bot.find(params[:botid])
		@triggerphrase = Triggerphrase.find(params[:id])
		@triggerphrase.destroy
		
		respond_to do |format|
			format.js
	  	end
	end

	def botsettings_reminder_create
		@bot = Bot.find(params[:id])
		@reminder = Reminder.create(params.require(:botsettingsreminder).permit(:reminder))
		@reminder.update(rebootconv: params[:date][:rebootconv], bot_id: @bot.id)		
		respond_to do |format|
			format.js
	  	end
	end

	def botsettings_reminder_edit
		@reminder = Reminder.find(params[:id])
		@bot = Bot.find(@reminder.bot_id)
		@reminder.update(params.require(:botsettingsupdatereminder).permit(:reminder))
		@reminder.update(rebootconv: params[:date][:rebootconv])		
		respond_to do |format|
			format.js
	  	end
	end

	def botsettings_reminder_delete
		@reminder = Reminder.find(params[:id])
		@bot = Bot.find(@reminder.bot_id)
		@reminder.destroy
		respond_to do |format|
			format.js
	  	end
	end
	
end