class HomeController < ApplicationController
	
  before_filter :authenticate_user!
  
  def index
  end

  def anagram_word_lookup

    @word = params[:anagram][:word]
    @anagram = Anagram.new
    @results = @anagram.get_anagram @word

    respond_to do |format|
      format.html
      format.json{ render json: @results.to_json }
    end
  end
end