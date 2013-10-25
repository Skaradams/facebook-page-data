class PagesController < ApplicationController
  def create
    page = Page.new params[:page]

    response = JSON.parse(HTTParty.get("#{ FB_ENDPOINT }/#{ page.fb_id }").body)

    page.name = response["name"]    
    page.image = "#{ FB_ENDPOINT }/#{ response["username"] }/picture"
  
    if page.save
      flash[:notice] = "La page a bien été ajoutée"
    else
      flash[:error] = "Erreur lors de l'ajout de la page"
    end
    redirect_to root_path
  end

  def show
    @page = Page.find params[:id]
    @response = JSON.parse(HTTParty.get("#{ FB_ENDPOINT }/#{ @page.fb_id }/posts", 
                  query: { access_token: FB_ACCESS_TOKEN }))
    if @response["data"]
      @response = @response["data"]
    else
      flash[:error] = "Erreur de chargement des messages"
      redirect_to root_path
    end

  end

  def destroy
  end
end
