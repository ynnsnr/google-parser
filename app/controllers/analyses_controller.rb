require 'csv'

class AnalysesController < ApplicationController
  def new
    @analysis = Analysis.new
  end

  def create
    @analysis = Analysis.new(analysis_params)
    save
  end

  def index
    @analyses = current_user.analyses
  end

  def show
    @analysis = Analysis.find(params[:id])
  end

  def upload
    keywords = CSV.read(analysis_params[:file].path).join("\n")
    @analysis = Analysis.new(raw_keywords: keywords)
    save
  end

  def save
    @analysis.user = current_user
    if @analysis.save
      redirect_to analysis_path(@analysis)
    else
      render :new
      # redirect_to new_analysis_path
      # flash[:alert] = @analysis.errors -> simple_form_for
    end
  end

  private

  def analysis_params
    params.require(:analysis).permit(:raw_keywords, :file)
  end
end
