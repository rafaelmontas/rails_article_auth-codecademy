class ArticlesController < ApplicationController
	before_action :require_user, only: [:show]
	before_action :require_author, only: [:edit, :update, :destroy]
	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
	end
end
