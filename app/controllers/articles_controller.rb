class ArticlesController < ApplicationController
	
	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)
        if logged_in?
          @article.user_id = current_user.id
        else
          flash[:alert] = "please login to create an article"
        end

  		  if @article.save
  		  	flash.now[:notice] = "Article successfully created"
  		  	redirect_to article_path(@article)
  		  else
  		  	render 'new'
  		  end
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
  		  if @article.update(article_params)
  		  	flash[:notice] = "Article successfully updated"
  		  	redirect_to article_path(@article)
  		  else
  		  	render 'edit'
  		  end
	end

	def show
		@article = Article.find(params[:id])
	end

	def destroy
		@article = Article.find(params[:id])
    if correct_user?(@article)
  		@article.destroy
  		flash[:notice] = "Article was deleted"
  		redirect_to users_articles_path(current_user)
    else
      flash[:alert] = "You cannot delete this article"
    end
	end


    def index
    	@articles = Article.all
    end




	private
  		def article_params
   		params.require(:article).permit(:title, :description)
  		end

      def correct_user?(article)
       current_user.id == article.user_id
      end


end
