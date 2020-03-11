class ItemsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @item = Item.new
    @item.images.new
    # @item.brands.new
    # @item.categorys.new
    # @item.sizes.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save!
      redirect_to   item_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end


  def item_params
    params.require(:item).permit(:name, :price,:explain,:postage,:region,:condition,:shipping,images_attributes: [:image])
  end
end
