class LatexController < ApplicationController
  before_action :set_latex, only: [:show, :edit, :update, :destroy]

  # GET /latex
  # GET /latex.json
  def index
        @diagnosed_raw = session[:tmp_diagnosis_raw]
	@diagnosed_right = session[:tmp_diagnosis_right].size.to_s
	@diagnosed_array = session[:tmp_diagnosis_array]

    render :layout => "latexout.pdf.erbtex", formats: [:pdf]
  end

  # GET /latex/1
  # GET /latex/1.json
  def show
  end

  # GET /latex/new
  def new
    #@latex = Latex.new
  end

  # GET /latex/1/edit
  def edit
  end

  # POST /latex
  # POST /latex.json
  def create
    #@latex = Latex.new(latex_params)

    respond_to do |format|
      if @latex.save
        format.html { redirect_to @latex, notice: 'Latex was successfully created.' }
        format.json { render action: 'show', status: :created, location: @latex }
      else
        format.html { render action: 'new' }
        format.json { render json: @latex.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /latex/1
  # PATCH/PUT /latex/1.json
  def update
    respond_to do |format|
      if @latex.update(latex_params)
        format.html { redirect_to @latex, notice: 'Latex was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @latex.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /latex/1
  # DELETE /latex/1.json
  def destroy
    @latex.destroy
    respond_to do |format|
      format.html { redirect_to latex_index_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_latex
      #@latex = Latex.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def latex_params
      params[:latex]
    end
end
