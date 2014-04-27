class ArticlesController < ApplicationController
  before_filter :authenticate_user!, :only => [:edit, :update, :destroy, :create, :new]
  before_action :set_article, :only => [:show, :edit, :update, :destroy]
  before_filter :is_owner, :only => [:edit, :update, :destory]
 
  def index
    @articles = Article.all
  end

  def comment
   Article.find(params[:id]).comments.create(params[comment_params])
   flash[:notice] = "Added your comment"
   redirect_to :action => "show", :id => params[:id]
end

  def show
  end

  def edit
  end

  def update
    if @article.update_attributes(article_params)
      redirect_to root_url, :notice => "Article was succesfully updated"
    else
      render 'edit'
    end
  end

  def new
    @article = Article.new
    
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user

    if @article.save
      redirect_to root_url, :notice => "Article was succesfully created"
    else
      render 'new'
    end
  end

  def destroy
  end

  private 
  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body)
  end
  def comment_params
    params.require(:comment).permit(:body)
  end
  def is_owner 
      article = Article.find(params[:id])
      unless user_signed_in? && article.user == current_user
        redirect_to(article, :notice => 'You cannot edit a article that you did not create.')
      end
    end
  
end
