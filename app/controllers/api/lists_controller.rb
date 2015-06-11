class Api::ListsController < ApiController
  before_action :authenticated?

  def create
    list = @current_user.lists.build(list_params)
    if list.save
      render json: list
    else
      render json: {errors: list.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    begin
      list = List.find(params[:id])
      if list.user == @current_user
        list.destroy
        render json: {}, status: :no_content
      else
        render json: {errors: 'not authorized'}, status: :not_authorized
      end
    rescue ActiveRecord::RecordNotFound
      render json: {}, status: :not_found
    end
  end

  private

  def list_params
    params.permit(:title, :permissions)
  end
end
