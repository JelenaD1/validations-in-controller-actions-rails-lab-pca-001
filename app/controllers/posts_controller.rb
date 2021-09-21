class PostsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  before_action :set_post!, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def update
    @post.update!(post_params)

    redirect_to post_path(@post)
  end

  private

  def post_params
    params.permit(:category, :content, :title)
  end

  def set_post!
    @post = Post.find(params[:id])
  end

  def render_unprocessable_entity_response(invalid)
    render :edit
  end
end
