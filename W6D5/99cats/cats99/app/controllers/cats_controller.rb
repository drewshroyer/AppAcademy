class CatsController < ApplicationController
# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birthday    :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string           not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null

  def index
    @cats = Cat.all
    render :index 
  end

  
  def show
    @cat = Cat.find(params[:id])
    render :show
  end

  
  def new
    @cat = Cat.new
    render :new
  end

  def edit
    @cat = Cat.find(params[:id])
  end

 
  def create
    @cat = Cat.new(cat_params)
    if @cat.save
      redirect_to cat_url(@cat)
    else
      render :new
      # render json: @bubble.errors.full_messages, status: 422
    end
  end

  def update
    @cat = Cat.find(params[:id])
    if @cat.update(cat_params)
      redirect_to cat_url(@cat)
    else
      render :edit
    end
  end

  def destroy
   @cat = Cat.find(params[:id])
   @cat.destroy
   redirect_to cats_url
  end

  private
    def cat_params
      params.require(:cat).permit(:birthday, :color, :name, :sex, :description)
    end
end
