class ArticlesController < ApplicationController
  layout "newl", :only => [:new]

	def index
 
  if params[:search]

    @articles = Article.search(params[:search]).order("created_at DESC").page(params[:page]).per(4)
   else
    @articles = Article.all.order('created_at desc').page(params[:page]).per(4)
  end
end

	def show 
		 @article = Article.find(params[:id])
     
	end

	def new

     @article = Article.new
end


def edit
  @article = Article.find(params[:id])
end 

def create
    @article = Article.new(article_params)
  if @article.save
    redirect_to @article
  else
    render 'new'
  end
end

def update
  @article = Article.find(params[:id])
 
  if @article.update(article_params)
    redirect_to @article
  else
    render 'edit'
  end
end

def destroy
  @article = Article.find(params[:id])
  @article.destroy
   redirect_to articles_path
end

def my_articles
  @article = Article.where(:user_id => current_user.id).order('created_at desc').page(params[:page]).per(4)
end

def user_articles
  
 @article = Article.where(:user_id => params["format"])
 @user = User.find(params["format"])
 end

  def user_likes
    # byebug
    @article = Article.find(params["format"])
    current_user.like!(@article)
     redirect_to articles_path
  end

    def user_unlikes
    # byebug
    @article = Article.find(params["format"])
    current_user.unlike!(@article)
     redirect_to articles_path
  end

def user_follow
    @user = User.find(params["format"])
    current_user.follow!(@user)
     redirect_to user_articles_articles_path(@user)
  end

  def user_unfollow
    @user = User.find(params["format"])
    current_user.unfollow!(@user)
     redirect_to user_articles_articles_path(@user)
  end

  def newsfeed
      current_user.followees(User).each do |user|
        @article = Article.where(:user_id => user.id).order('created_at desc').page(params[:page]).per(4)
        end
   
  end

 
private
  def article_params
    params.require(:article).permit(:post, :description, :photo, :video, :user_id)
  end

end
