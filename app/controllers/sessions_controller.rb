class SessionsController < ApplicationController

	def new
 	end

	def create 

		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			login user
			redirect_to user
      		#flash[:notice] = "logged in"
        else
      # Create an error message.
        render 'new'
        end

 	end

	def destroy
		log_out 
		redirect_to root_path
 	end

end
