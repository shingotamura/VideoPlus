class MachinesController < ApplicationController
  def show
    @user = User.find(params[:id])
    counts(@user)
  end
end
