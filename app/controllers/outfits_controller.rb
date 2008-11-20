class OutfitsController < ApplicationController
  # GET /outfits
  # GET /outfits.xml

  before_filter :login_required, :except => ["show"]


  def index
    @outfits = current_user.outfits
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
    @outfit.user = current_user
    
    @photo = Photo.new(params[:photo])
    @photo.outfit = @outfit
    
    if params[:tags][:tags]
      @outfit.tag_list.add(params[:tags][:tags].split(','))
    end
    
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

  def vote_for
    @outfit = Outfit.find(params[:id])

    current_user.vote_for(@outfit)    

    respond_to do |format|
      if @outfit.save
        flash[:notice] = 'Outfit was applauded.'
        format.html { redirect_to(@outfit) }
        format.xml  { head :ok }
        # format.js {returns rjs to fill}
      else
        flash[:notice] = 'It appears you already voted.'
        format.html { render :action => "show" }
        format.xml  { render :xml => @outfit.errors, :status => :unprocessable_entity }
        # format.js {returns rjs to fill}
        
      end
    end
  end
  
  def vote_against
    @outfit = Outfit.find(params[:id])

    current_user.vote_against(@outfit)        
    
    respond_to do |format|
      if @outfit.save
        flash[:notice] = 'Outfit was discouraged.'
        format.html { redirect_to(@outfit) }
        format.xml  { head :ok }
      else
        flash[:notice] = 'It appears you already voted.'
        format.html { render :action => "show" }
        format.xml  { render :xml => @outfit.errors, :status => :unprocessable_entity }
      end
    end
  end
  
end
