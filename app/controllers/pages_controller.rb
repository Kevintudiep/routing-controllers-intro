class PagesController < ApplicationController

before_action :set_kitten_url, only: [:kitten, :kittens]

  def welcome
    @header = "This is the Welcome Page!"
    render :about
  end

  def about
    @header = "i love dogs!"
  end

  def contest
    flash[:notice] = "Sorry, the contest has ended"
    redirect_to '/welcome'
  end


  def kitten
  end

  def kittens
  end

  def secrets
    if params[:magic_word] == "kitty"
      redirect_to '/secrets/:magic_word'
    else
      flash[:alert] = "Sorry, you're not authorized to see that page!"
      redirect_to '/welcome'
    end
  end



  def set_kitten_url
   requested_size = params[:size]
   @kitten_url = "http://placekitten.com/#{requested_size}/#{requested_size}"
  end

end
