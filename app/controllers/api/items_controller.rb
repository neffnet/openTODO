class Api::ItemsController < ApiController
  before_action :authenticated?

  def create
    list = List.find(params[:list_id])
    item = list.items.build(item_params)
    if item.save
      render json: item
    else
      render json: {errors: item.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    begin
      item = Item.find(params[:id])
      list = item.list
      if authorized?(list, "destroy")
        item.destroy
        render json: {}, status: :no_content
      else
        render json: {errors: "not authorized"}, status: :not_authorized
    rescue ActiveRecord::RecordNotFound
      render json: {}, status: :not_found
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end

end
