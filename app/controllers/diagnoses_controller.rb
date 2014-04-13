class DiagnosesController < ApplicationController
  # there is no model to be looked through
  #before_action :set_diagnosis, except: [:math, :chemistry]

  #rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  # GET /diagnoses
  # GET /diagnoses.json
  def index
    #@questions = Question.all#.sample(2)

   # THIS IS IMPORTANT. Without this, you still get the last checked value when the user come to the index action directly.
	session[:tmp_diagnosis_raw] = nil
	session[:tmp_diagnosis_right] = nil
	session[:tmp_diagnosis_array] = nil


  end


  def math
    @maths = Question.joins(:category).where("categories.title = ?", "Mathematik").sample(2) 

   # THIS IS IMPORTANT. Without this, you still get the last checked value when the user come to the index action directly.
	session[:tmp_diagnosis_raw] = nil
	session[:tmp_diagnosis_right] = nil
	session[:tmp_diagnosis_array] = nil
  end


  def chemistry
    @chemistries= Question.joins(:category).where("categories.title = ?", "Chemie").sample(2) 

   # THIS IS IMPORTANT. Without this, you still get the last checked value when the user come to the index action directly.
	session[:tmp_diagnosis_raw] = nil
	session[:tmp_diagnosis_right] = nil
	session[:tmp_diagnosis_array] = nil

  end



  def show
  end

  def edit
	
  end



  # POST /diagnoses
  # POST /diagnoses.json
  def create
	#flash[:message] = params[:question_ids]

        # ["1 2", "2 1", "3 2"]


	right = []
        result = []
	array = []
        
        begin
	  params[:question_ids].each do |p|
		result = p.gsub(/\s+/m, ' ').strip.split(" ")
		array << [result[0],result[1]]
		if result[1] == Question.find(result[0].to_i).right.to_s then right << [result[0],result[1]] end
	end

          rescue
            redirect_to(:action => 'index')
          return
        end

	
        if right.empty?
		r = "0" 
	else r = right.size end

        #flash[:message] = "Richtig sind: " + r.to_s #+ params[:question_ids].to_s + "result: " + result.to_s

	session[:tmp_diagnosis_raw] = params[:question_ids]
	session[:tmp_diagnosis_array] = array
	session[:tmp_diagnosis_right] = right
	
  	redirect_to diagnosed_diagnoses_path

        
#        respond_to do |format|
 #     	format.html { redirect_to diagnoses_url }
  #   	format.json { head :no_content }
   # 	end

    
  end


  #GET from form_tag
  def diagnosed

    @questions = Question.all


        @diagnosed_raw = session[:tmp_diagnosis_raw]
	@diagnosed_right_size = session[:tmp_diagnosis_right].size.to_s
	@diagnosed_right = session[:tmp_diagnosis_right]
	@diagnosed_array = session[:tmp_diagnosis_array]

    begin
      ex = nil
      ex = []
      wrong = nil
      wrong = []
      wrong = session[:tmp_diagnosis_array] - session[:tmp_diagnosis_right]
        if wrong.empty? then
          ex = ["Nichts zu üben 1"]
        else
          wrong.each do |e|
          ex << Question.find(e[0][0]).exercise
        end

      end

    rescue
      ex = ["Nichts zu üben 2"]
    end

    session[:tmp_diagnosed_ex] = ""
 
    session[:tmp_diagnosed_ex] = ex.join.to_s

    @diagnosed_exs = session[:tmp_diagnosed_ex]

    @diagnosed_ex = ex


  end


  private
    # Use callbacks to share common setup or constraints between actions.
    #  #### there is no model to be found!
    #def set_diagnosis
    #  #@diagnosis = Diagnosis.find(params[:id])
    #end

    # Never trust parameters from the scary internet, only allow the white list through.
    def diagnosis_params
      params[:diagnosis]
    end

# def record_not_found
  #   redirect_to action: :index
  # end

end
