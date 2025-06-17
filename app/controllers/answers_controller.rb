class AnswersController < ApplicationController
  # 回答の登録
  def create
    # p params
    @question = Question.find(params:[question_id])
    @question.answers.create(answer_params)
    redirect_to question_path(@question)
  end

  # 回答の削除
  def destroy
    @question = Question.find(params[:question_id]) #該当の質問を特定する
    @answer = @question.answers.find(params[:id]) #該当の回答を特定する
    @answer.destroy #回答を削除する
    redirect_to @question, sutatus: :see_other #指定された@questionのURLにリダイレクトする。
    #「sutaus: :see_other」は、HTTPステータスコード303を返すが、リクエストをGETメソッドにしてリダイレクトする効果がある。
  end

  private
  def answer_params
    params.require(:answer).permit(:name, :content)
  end
end