class  AnswersController < ActionController::Base
  before_action :set_answer, only: [:show, :edit, :update, :destroy]

  def create

    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question = @question

  #   if @answer.save
  #   flash[:notice] = "Answer was saved successfully."
  #   redirect_to question_path(@question)
  # else

     if @answer.save
       redirect_to @question, notice: 'New answer was successfully created.'
     else
       redirect_to @question
     end
  end

  private

  def answer_params
    params.require(:answer).permit(:description)
  end
end
