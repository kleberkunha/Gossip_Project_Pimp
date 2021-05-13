class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def new
    # Pour revenir au gossip sur lequel on ajoute un commentaire
    @gossip = Gossip.find(params[:gossip_id]) 
    # Pour ajouter un commentaire
    @comment = Comment.new
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def create
    if (current_user)
      @gossip = Gossip.find(params[:gossip_id])
      @comment=Comment.new(content: params[:content], user: User.find_by_first_name("anonymous"), gossip: @gossip)
      if @comment.save # essaie de sauvegarder en base @gossip
        redirect_to "/index"
        flash[:info] = "Comment Saved!!"
        # si ça marche, il redirige vers la page d'index du site
      else
        redirect_to "/gossips/", notice: "Erreur de sauvegarde"
        # sinon, il render la view new (qui est celle sur laquelle on est déjà)
      end
    else
      redirect_to "/sessions/new"
    end
  end

  def update
    @comment = Comment.find(params[:id])
    @gossip = Gossip.find(params[:gossip_id])

    if @comment.update(content: params[:content])

      flash[:info] = "Gossip successfully modified!"
      redirect_to gossip_path(@gossip.id)
    else
      render 'edit'
    end
  end

  def destroy
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.find(params[:id])

    @comment.destroy
    flash[:alert] = "Comment deleted!"
    redirect_to gossip_path(@gossip.id)
  end
end