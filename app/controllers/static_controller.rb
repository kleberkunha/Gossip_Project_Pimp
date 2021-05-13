class StaticController < ApplicationController
  def index
    @gossips = Gossip.all
  end

  def welcome
  end

  def team
  end

  def contact
  end

  def author
  end
end
