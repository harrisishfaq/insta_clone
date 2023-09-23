class SuggestionController < ApplicationController

  def create_suggestion
    Suggestion.create(suggestion_params) if suggestion_params
    redirect_to post_path(params[:suggestion][:suggestionable_id])
  end

  private
  def suggestion_params
    params.require(:suggestion).permit!
  end
end
