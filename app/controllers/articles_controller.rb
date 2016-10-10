class ArticlesController < ApplicationController
	before_action :require_user, only: [:show]
	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
	end
end
