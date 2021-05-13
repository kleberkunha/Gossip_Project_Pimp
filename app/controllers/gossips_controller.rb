class GossipsController < ApplicationController
  def new
    @gossip = Gossip.new
  end


  def create
    if (current_user)
      @gossip = Gossip.new(title: params[:title], content: params[:content], user: current_user)
      if @gossip.save
        redirect_to '/index'
        flash[:alert] = "Gossip Saved!!"
        
        # sinon, il render la view new (qui est celle sur laquelle on est déjà)
      else
        render 'new'
      end
    else
      redirect_to "/sessions/new"
    end

  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def post_params
    post_params = params.require(:gossip).permit(:title, :content)
  end

  def update
    @gossip = Gossip.find(params[:id])
    @gossip.update(post_params)
    redirect_to index_path
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to index_path
  end


  def comment
    @comment=Comment.new(content: params[:content], user_id: User.find_by_first_name("anonymous"), gossip_id: params[:id])
    if @comment.save # essaie de sauvegarder en base @gossip
      redirect_to "/index"
      flash[:info] = "Gossip Saved!!"
      # si ça marche, il redirige vers la page d'index du site
    else
      redirect_to "/gossips/new", notice: "Erreur de sauvegarde"
      # sinon, il render la view new (qui est celle sur laquelle on est déjà)
    end
    t.bigint "gossip_id"
  end

  def show
    @gossip = Gossip.find(params[:id])
    @comment = Comment.new
  end

end