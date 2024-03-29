class PastesController < ApplicationController

  def create
    paste = Paste.new paste_params
    render :new && return if paste.nil?
    if paste.save
      redirect_to show_paste_path paste.token
    else
      redirect_to new_paste_path
    end  
  end

  def show
    @paste = Paste.find_by paste_params
  end

  private

  def paste_params
  	params.permit :content, :token
  end	
end
