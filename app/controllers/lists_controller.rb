class ListsController < ApplicationController
  before_action :find_list, only: [:show, :destroy]

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @list = List.includes(:reviews).find(params[:id])
    end
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list), data: {turbo_method: :create, turbo_confirm: "Ayy new list created"}

    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_path, status: :see_other
  end

  def find_list
    @list = List.find(params[:id])
  end

  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end
