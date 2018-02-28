class DepartmentsController < ApplicationController
    before_action :set_department, only: [:show, :update, :edit, :destroy]

    def index
      @departments = Department.all
    end

    def show
      @department = Department.find(params[:id])
    end

    def new
      @department = Department.new
    end

    def edit
    end

    def create
      if @department.save(department_params)
        redirect_to departments_path
      else
        render :new
      end
    end

    def update
      if @department.update(department_params)
        redirect_to @department
      else
        render :edit
      end
    end

    def destroy
      @department.destroy
      redirect_to departments_path
    end

    private

      def set_department
        @department = Departments.find(params[:id])
      end

      def sub_department
        params.require(:department).permit(:name)
      end
  end
