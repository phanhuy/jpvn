class WordsController < ApplicationController
  def index
    @category = Category.find params[:category_id]
    #@filter_state = params[:filter_state]
    #@words = @category.words.send(@filter_state, current_user, @category)
    @words = @category.words
    @words = @words.paginate page: params[:page], per_page: 50

    @categories_list = Category.all.collect{|category|
      [category.name, category_words_path(category)]}

    StudyLog.create(user_id: current_user.id,content: @category.name+"というカテゴリを勉強しました。")

    respond_to :html, :js
  end
end
