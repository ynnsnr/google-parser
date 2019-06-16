class ResultsController < ApplicationController
  def download
    @result = Result.find(params[:format])
    send_data @result.raw_html, filename: "#{@result.keyword}_raw_html.txt"
  end
end
