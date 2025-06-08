class QuestionsController < ApplicationController
  # 質問一覧表示
  def index
    @questions = Question.all
    # p @questions
  end

  # 質問の詳細ページ表示
  def show
    # p params[:id]
    @question = Question.find[params[:id]]
    # p @question
  end

  # 質問の作成
  def new
    @question = Question.new
  end

  # 質問の登録
  def create
    # Questionモデルを初期化
    @question = Question.new(question_params)
    # QuestionモデルをDBへ保存
    if @question.save
      # showアクションにリダイレクト
      redirect_to @question # パスを具体的に指定しなくても、Railsが裏側の処理で該当のパスを自動生成してくれる。
    else
      render 'new', status: unprocessable_entity
    end
  end

  # 質問の編集
  def edit
    @question = Question.find(params[:id])
  end

  # 質問の更新
  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to @question
    else
      render 'edit', sutatus: :unprocessable_entity
    end
  end

  # 質問の削除
  def destroy
    @question = Question.find(params[:id]) #削除したいレコードを「@question = Question.find(params[:id])」で検索して、インスタンス変数の@questionに入れる。
    @question.destroy #「@question.destroy」で質問の削除を行う。
    redirect_to questions_path #「redirect_to questions_path」で、質問の一覧ページに飛ぶ。
  end

  private
  def question_params　#メソッド名は慣習として「question_params」を利用する。
    params.require(:question).permit(:title, :name, :content)
    #requireメソッドで「データのオブジェクト名」を指定、permitメソッドで「データベース保存の処理に使うカラム」を指定。
  end
end