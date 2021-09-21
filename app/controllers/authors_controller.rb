class AuthorsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  def show
    @author = Author.find(params[:id])
  end

  def new
  end

  def create
    @author = Author.create!(author_params)

    redirect_to author_path(@author)
  end

  private

  def author_params
    params.permit(:email, :name)
  end

  def render_unprocessable_entity_response(invalid)
    render :new
  end
end
