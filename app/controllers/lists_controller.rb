class ListsController < ApplicationController
  def index
    @lists = List.all

  end

  def show
    @list = List.find(params[:id])

  end

  def new
  @list = List.new
  end

  def create
    @list = List.new(params[:list])
    if @list.save
      flash[:notice] = "Congratulations you have saved your list"
      redirect_to lists_path
    else
      render :new
    end
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list= List.find(params[:id])
    if @list.update(params[:list])
      flash[:notice]= "You have successfully changed your list"
      redirect_to lists_path
    else
      render :edit
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path
  end

private
  def list_params
    params.require(:list).permit(:name, :description)
  end
end
