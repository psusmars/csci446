class ArticlesController < ApplicationController

	before_filter :get_authors

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
		@articles = Article.paginate page: params[:page], order: 'created_at desc',	per_page: 10
    respond_to do |format|
      format.html # index.html.haml
      format.json { render json: @articles }
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.find(params[:id])
		
    respond_to do |format|
      format.html # show.html.haml
      format.json { render json: @article }
    end
  end

  # GET /articles/new
  # GET /articles/new.json
  def new
    @article = Article.new
		@text_for_submit_btn = "Create!"
		
		
    respond_to do |format|
      format.html # new.html.haml
      format.json { render json: @article }
    end
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
		session[:last_article_page] = request.env['HTTP_REFERER'] || articles_url
		@text_for_submit_btn = "Save Changes"
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(params[:article])
		
    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render json: @article, status: :created, location: @article }
      else
        format.html { render action: "new" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /articles/1
  # PUT /articles/1.json
  def update
    @article = Article.find(params[:id])
		
    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to session[:last_article_page] || articles_url, notice: 'Article was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url }
      format.json { head :ok }
    end
  end
	
	private
	def get_authors
		@authors = Author.all
	end
end
