class QuestionsController < ApplicationController
  before_action :set_question, only: [ :show, :edit, :destroy ]
  before_action :authorize, only: [ :create, :edit, :destroy, :new, :update ]
  # before_action :authorize, only: [ :edit, :destroy ]

  def index
    @questions = Question.all.order(created_at: :desc)
  end

  def show
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user = current_user

    if @question.save
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
