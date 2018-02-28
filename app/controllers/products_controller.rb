class ProductsController < ApplicationController
    before_action :set_sub
    before_action :set_topic, only: [:show, :edit, :update, :destroy]

    def index
      @products = @department.topics
    end

    def show
    end

    def new
      @product = @department.topics.new
      render partial: "form"
    end

    def edit
      render partial: "form"
    end

    def create
      @product = @product.department.new(products_params)

      if @product.save
        redirect_to [@department, @product]
      else
        render :new
      end
    end

    def update
      if @product.update(product_params)
        redirect_to [@department, @product]
      else
        render :edit
      end
    end

    def destroy
      @product.destroy
      redirect_to department_products_path
    end

    private #methods that can only be accessed in this "ProductsController"
      def set_department
        @product = Department.find(params[:product_id])
      end

      def set_department
        @product = Product.find(params[:id])
      end

      def product_id_params
        params.require(:product).permit(:name, :price, :body)
      end
  end
