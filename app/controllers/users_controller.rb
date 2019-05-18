class UsersController < ApplicationController
	
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			login @user
			redirect_to user_path(@user)
		else
			render 'new'
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to user_path(@user)
		else
			render 'edit'
		end
	end

	def show
		@user = User.find(params[:id])
	end

	def articles
		@user = User.find(params[:id])
		@user_articles = @user.articles
	end

    private

    def user_params
      params.require(:user).permit(:username, :email, :password)
    end

end
