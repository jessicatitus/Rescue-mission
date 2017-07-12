class QuestionsController < ActionController::Base
  # before_action :set_question, only: [:show, :edit, :update, :destroy]
  def index
    @questions = Question.all.order(created_at: :desc)
  end

  def show

    @question = Question.find(params[:id])
    @answers = @question.answers.order(created_at: :desc) #order answers as they are created
    @new_answer = Answer.new
  end

  def new
    @question = Question.new
  end

  def create
    user = User.find_by(username: question_params[:user])

    if user
      new_question_params = question_params.merge( {user: user})
      @question = Question.new(new_question_params)

     if @question.save
       redirect_to @question, notice: 'New question was successfully created.'
     else
       render action: 'new'
     end
    end
  end

  # PATCH/PUT /cars/1
  def update

      @question = Question.find(params[:id])
      user = @question.user
      

    if @question.update(question_params.merge!(user: user))
      redirect_to @question, notice: 'Your question was successfully updated.'
    else
      render :edit
    end
  end

  def edit
      @question = Question.find(params[:id])

  end

  # DELETE /questions/1
  def destroy


    @question = Question.find(params[:id])
    @question.destroy
    @questions = Question.all.order(created_at: :desc)
    redirect_to questions_path, notice: "Question was destroyed!"
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def question_params
    params.require(:question).permit(:title, :description, :user)
  end
  def set_question
      @question = Question.find(params[:id])
  end
end
