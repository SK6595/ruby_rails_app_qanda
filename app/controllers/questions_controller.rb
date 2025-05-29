class QuestionsController < ApplicationController
  # 質問一覧表示
  def index
  end

  # 質問の詳細ページ表示
  def show
  end

  # 質問の作成
  def new
    @question = Question.new
  end

  # 質問の登録
  def create
    # p params
    p question_params
  end

  # 質問の編集
  def edit
  end

  # 質問の更新
  def update
  end

  # 質問の削除
  def destroy
  end
  
  private
  def question_params　#メソッド名は慣習として「question_params」を利用する。
    params.require(:question).permit(:title, :name, :content) 
    #requireメソッドで「データのオブジェクト名」を指定、permitメソッドで「データベース保存の処理に使うカラム」を指定。
  end
end