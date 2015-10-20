class QuestionsController < ApplicationController
  before_action :set_question, only: [ :show, :edit, :destroy ]
  before_action :authorize, only: [ :create, :edit, :destroy, :new, :update ]
  # before_action :authorize, only: [ :edit, :destroy ]

  def index
    @questions = Question.find_with_reputation(:votes, :all, order: "votes desc")
  end

  def vote
    begin
      value = params[:type] == "up" ? 1 : -1
      @question = Question.find(params[:id])
      @question.add_evaluation(:votes, value, current_user)
      redirect_to :back, notice: "Thank you for voting"
    rescue ActiveRecord::RecordInvalid
      redirect_to :back, notice: "You already voted!"
    end
  end

  def show
    @answer = Answer.new
    @answers = @question.answers.find_with_reputation(:votes, :all, order: "votes desc")
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user = current_user

    if @question.save
      UserMailer.new_question_email(current_user).deliver_now

      flash[:success] = "Question created successfully"
      redirect_to @question
    else
      render 'new'
    end
  end

  def edit
  end



  def update
    if @question.update(question_params)
      flash[:success] = "Question updated successfully"
      redirect_to @question
    else
      render 'edit'
    end
  end

  def destroy
  end

  private

    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:title, :content, :picture)
    end

end
