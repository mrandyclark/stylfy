class OutfitsController < ApplicationController
  # GET /outfits
  # GET /outfits.xml
  def index
    @outfits = Outfit.find(:all)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @outfits }
    end
  end

  # GET /outfits/1
  # GET /outfits/1.xml
  def show
    @outfit = Outfit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @outfit }
    end
  end

  # GET /outfits/new
  # GET /outfits/new.xml
  def new
    @outfit = Outfit.new
    @photo = Photo.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @outfit }
    end
  end

  # GET /outfits/1/edit
  def edit
    @outfit = Outfit.find(params[:id])
  end

  # POST /outfits
  # POST /outfits.xml
  def create
    @outfit = Outfit.new(params[:outfit])
    
    @photo = Photo.new(params[:photo])
    @photo.outfit = @outfit
    
    respond_to do |format|
      if @outfit.save && @photo.save
        flash[:notice] = 'Outfit was successfully created.'
        format.html { redirect_to(@outfit) }
        format.xml  { render :xml => @outfit, :status => :created, :location => @outfit }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @outfit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /outfits/1
  # PUT /outfits/1.xml
  def update
    @outfit = Outfit.find(params[:id])

    respond_to do |format|
      if @outfit.update_attributes(params[:outfit])
        flash[:notice] = 'Outfit was successfully updated.'
        format.html { redirect_to(@outfit) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @outfit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /outfits/1
  # DELETE /outfits/1.xml
  def destroy
    @outfit = Outfit.find(params[:id])
    @outfit.destroy

    respond_to do |format|
      format.html { redirect_to(outfits_url) }
      format.xml  { head :ok }
    end
  end
  
end
