class ClothingArticlesController < ApplicationController
  before_action :logged_in?
  before_action :set_post
  before_action :set_clothing_article, only: [:edit, :update, :destroy]
  before_action :correct_user?

  def new
    @clothing_article = @post.clothing_articles.build
  end

  def create
    @clothing_article = @post.clothing_articles.build(clothing_article_params)
    @clothing_article.user = current_user
    if @clothing_article.save
      redirect_to [current_user, @post]
      flash[:notice] = "Clothing article was successfully created."
    else
      render 'new'
    end
  end

  def destroy
    @clothing_article.destroy
    flash[:notice] = "Clothing article was successfully destroyed."
    redirect_to [current_user, @post]
  end

  def edit
  end

  def update
    if @clothing_article.update_attributes(clothing_article_params)
      flash[:success] = "Post updated"
      redirect_to [current_user, @post]
    else
      render 'edit'
    end
  end


  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_clothing_article
    @clothing_article = ClothingArticle.find_by(post_id: params[:post_id],
                         id: params[:id])
  end

  def clothing_article_params
    params.require(:clothing_article).permit(:title, :description, :url)
  end
end
