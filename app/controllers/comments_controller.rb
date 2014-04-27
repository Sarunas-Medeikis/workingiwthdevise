class CommentsController < ApplicationController
  before_filter :authenticate_user!, :only => [:edit, :update, :destroy, :create, :new]
  before_action :set_comment, :only => [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def edit
  end

  def new
    @comment = Comment.new
  end

  def create
      @comment = Comment.new(comment_params)

      if @comment.save
        redirect_to root_url, :notice => "Comment was succesfully posted!"
      end
  end

  def update
  end

  def destroy
  end

  private
  def set_comment
    @comment = Comment.find(params[:id])    
  end
  def comment_params
    params.require(:comment).permit(:body)
  end

end
