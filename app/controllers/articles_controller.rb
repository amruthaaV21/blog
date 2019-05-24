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
    @commentable = find_commentable
    @comments = @commentable.comments.arrange(:order => :created_at)
    @comment = Comment.new


    
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

    def main
      @articles_random = Article.offset(rand(7)).limit(6)
      @articles_recent = Article.order(created_at: :desc).last(10)
      #@articles = Article.order("RAND()").first(6)
    end 

    def get_recent
      
    end
   
	private
  		def article_params
   		params.require(:article).permit(:title, :description, :image)
  		end

      def correct_user?(article)
       current_user.id == article.user_id
      end

      def find_commentable
       return params[:controller].singularize.classify.constantize.find(params[:id])
      end


end
