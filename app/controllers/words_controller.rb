class WordsController < ApplicationController
  def index
    @category = Category.find params[:category_id]
    @filter_state = params[:filter_state] || "全部"
    @words = @category.words.all_word @category.id
    if @filter_state == "全部"
      @words = @category.words.all_word @category.id
    elsif @filter_state == "ブックマーク"
      @words = @category.words.bookmark_word @category.id
    elsif @filter_state == "ブックマークしません"
      @words = @category.words.no_bookmark_word @category.id
    end  
    # @words = @category.words.send(@filter_state, current_user, @category)
    # @words = @category.words
    @words = @words.paginate page: params[:page], per_page: 50

    @categories_list = Category.all.collect{|category|
      [category.name, category_words_path(category)]}

    StudyLog.create(user_id: current_user.id,content: @category.name+"というカテゴリを勉強しました。")

    respond_to :html, :js
  end

  def update
    word = Word.find params[:word_id]
    if params[:type_of_action] == "set_no_bookmark"
      word.bookmark = false
      word.save
      render json: {message: "ok"},
      status: :ok
    elsif params[:type_of_action] == "set_bookmark"
      word.bookmark = true
      word.save
      render json: {message: "ok"},
      status: :ok
    else
      respond_to do |format|
        render json: {message: "failed"}
      end
    end
  end
end
