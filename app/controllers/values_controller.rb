class ValuesController < ApplicationController
  before_action :logged_in_employee, only:[:new, :create, :show, :index]
  
  def index
  end
  
  def new
    @employee = current_employee
    @value = current_employee.values.build
  end
  
  def create
    @value = current_employee.values.build(value_params)
    if @value.save
      flash[:success] = "Finish Stress Check!"
      redirect_to value_path(@value)
    else
      render 'new'
    end
  end
  
  def show
    @value = Value.find(params[:id]) 
    
  end
  
  
  private 
  
    def value_params
      params.require(:value).permit(:a1, :a2, :a3, :a4, :a5, :a6, :a7, :a8, :a9,
      :a10, :a11, :a12, :a13, :a14, :a15, :a16, :a17, :b1, :b2, :b3, :b4, :b5,
      :b6, :b7, :b8, :b9, :b10, :b11, :b12, :b13, :b14, :b15, :b16, :b17, :b18,
      :b19, :b20, :b21, :b22, :b23, :b24, :b25, :b26, :b27, :b28, :b29, :c1, :c2,
      :c3, :c4, :c5, :c6, :c7, :c8, :c9, :d1, :d2)
    end
    
end
