class CommandsController < ApplicationController

	def index 
	end

	def new
		@command = Command.new
	end

	def create
		@command = Command.new(command_params)
		if @command.save
			redirect_to :action => 'display'
		else
			render :action => 'new'
		end
	end

	def display
	  	@command = Command.all
		rescue ActiveRecord::RecordNotFound => e
  			my_record = nil
	end

	def command_params
		params.require(:command).permit(:name, :content)
	end

	def show
		@command = Command.find(params[:id])
	end

	def execute
		@command = Command.find(params[:id])
		@execcommand = @command.content + " >> exec-log.txt"
		@output = `#{@command.content} `
	end

	def recent
		@command = Command.find(5)
	end

	def edit
		@command = Command.find(params[:id])
		rescue ActiveRecord::RecordNotFound => e
  			my_record = nil
	end

	def update
		@command = Command.find(params[:id])
		rescue ActiveRecord::RecordNotFound => e
  			my_record = nil
		
		if @command.update_attributes(command_params)
	    	redirect_to :action => 'show', :id => @command
		else
	    	render :action => 'edit'
	 	end
	   
	end
	def delete
		@command = Command.find(params[:id]).destroy
		rescue ActiveRecord::RecordNotFound => e
  			my_record = nil
		redirect_to :action => 'display'
	end
end
