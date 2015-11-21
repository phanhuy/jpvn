class CategoriesController < ApplicationController
  before_action :authenticate_user!, only: :index

  def index
    @categories = Category.all.paginate page: params[:page],
      per_page: 10
  end
end
