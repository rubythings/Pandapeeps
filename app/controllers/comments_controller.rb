class CommentsController < ApplicationController
  before_filter :get_article

  def index
    @comments = @article.comments
  end

  def show
    @comment = @article.comments.first
  end

  def new
    @comment = @article.comments.new
  end

  def create
    begin
      @article.comments.create!(params[:comment])
      redirect_to @article, :notice => "Successfully created comment."
    rescue Mongoid::Errors::Validations
      @comment = @article.comments.new
      render :action => 'new'
    end
  end

  def edit
    @comment = @article.comments.find(params[:id])
  end

  def update
    @comment = @article.comments.find(params[:id])
    if @comment.update_attributes(params[:comment])
      redirect_to article_comment_path(@article,@comment), :notice  => "Successfully updated comment."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @article.comments.find(params[:id]).destroy
    redirect_to article_comments_url(@article), :notice => "Successfully destroyed comment."
  end
  private
  def get_article
    @article = Article.find(params[:article_id])
  end
end
