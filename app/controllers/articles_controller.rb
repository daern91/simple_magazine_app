class ArticlesController < ApplicationController
  before_action :user_authorization, except: [:index, :show, :new, :create]

  def index
    # @articles = Article.all
    @articles = Article.where(nil)
    @articles = @articles.tag(params[:tag]) if params[:tag].present?
    @articles = @articles.subtag(params[:subtag]) if params[:subtag].present?
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      redirect_to @article, notice: "Article created!"
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    redirect_to @article, notice: "Article updated!"
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_url, notice: "Article deleted!"
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :all_tags, :all_subtags)
  end

  def user_authorization
    unless current_user.id == Article.find(params[:id]).user_id
      flash[:alert] = "Not authorized!"
      redirect_to(article_path(params[:id]))
    end
  end
end
