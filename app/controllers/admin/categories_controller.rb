class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: ENV['ADMIN_USER'], password: ENV['ADMIN_PASSWORD']



def index
  @categories = Category.order(id: :desc).all
end

 def new
  @category = Category.new
end

 def create
  @category = Category.new(category_params)
    if @Category.save
    redirect_to [:admin, :categories], notice: 'Category created!'
  else
    render :new
  end
end

private

def product_params
  params.require(:category).permit(
    :name,
  )
 end 

end
