class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy], except: [:math, :chemistry]
  before_filter :authenticate_user!
  #rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  
  layout 'wide'

  # GET /questions
  # GET /questions.json
  def index


    @question = Question.all

    @category = Category.all
  end

  def math
    @maths= Question.joins(:category).where("categories.title = ?", "Mathematik")

  end

  def chemistry
    @chemistries= Question.joins(:category).where("categories.title = ?", "Chemie")

  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  # GET /questions/new
  def new
   @question = Question.new
   @category = Category.all 
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)
 
    @category = Category.all
    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render action: 'show', status: :created, location: @question }
      else
        format.html { render action: 'new' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:title, :number, :content, :answer1, :answer2, :answer3, :answer4, :right, :category_id, :exercise )
    end

#   def record_not_found
#     redirect_to action: :index
#   end
end
