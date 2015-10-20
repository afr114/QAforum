class AnswersController < ApplicationController
  before_action :set_answer, only: [:edit, :update, :destroy]
  before_action :authorize, only: [:create, :edit, :destroy, :new, :update]

  def index
    @answers = Answer.all
  end

  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(answer_params)
    @answer.user = current_user
    @question = Question.find(params[:question_id])
    @answer.question = @question

    if @answer.save
      flash[:success] = "Answer created successfully"
      redirect_to @question
    else
      render 'new'
    end
  end


  def vote
    begin
      value = params[:type] == "up" ? 1 : -1
      @answer = Answer.find(params[:id])
      @answer.add_evaluation(:votes, value, current_user)
      redirect_to :back, notice: "Thank you for voting"
    rescue ActiveRecord::RecordInvalid || NameError
      redirect_to :back, notice: "Vote added!"
    end
  end

  def edit

  end

  def update
    if @answer.update(answer_params)
      flash[:success] = "Question updated successfully"
      redirect_to
    else
      render 'edit'
    end
  end

  def destroy
  end

  private

  def answer_params
    params.require(:answer).permit(:content, :question, :question_id)
  end

  def set_answer
    @answer = Answer.find(params[:id])
  end

end
