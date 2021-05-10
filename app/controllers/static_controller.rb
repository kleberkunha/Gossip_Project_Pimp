class StaticController < ApplicationController
  def index
    puts "*" * 60
    arr_name = Array.new
    Gossip.all.each do |g|
      arr_name << [g.id, g.user.first_name, g.title]
    end
    params[:data_gossip] = arr_name
  end

  def welcome
  end

  def team
  end

  def contact
  end

  def author
  end

  def show
  end
end
