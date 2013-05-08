class PicturesController < ApplicationController
  # GET /pictures
  # GET /pictures.json
  #load_and_authorize_resource

before_filter :authenticate_user!
  
  def index
    @pictures = Picture.where(:user_id => current_user.id)
 

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @pictures.collect { |p| p.to_jq_upload }.to_json }
    end
  end

  # GET /pictures/1
  # GET /pictures/1.json
  def show
    @picture =Picture.find(params[:id])

    #authorize! :read, @picture

   # authorize! :read, @picture

    # @picture is already loaded and authorized
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @picture }
    end
  end

  # GET /pictures/new
  # GET /pictures/new.json
  def new
    @picture = Picture.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @picture }
    end
  end

  # GET /pictures/1/edit
  def edit
    @picture = Picture.find(params[:id])
    # authorized! if cannot? :update , @picture

  end

  # POST /pictures
  # POST /pictures.json
  def create
    @picture = Picture.new(params[:picture])

    respond_to do |format|
   
      if @picture.save
       format.json { render :json => [ @picture.to_jq_upload ].to_json }
      else
       
        #format.json { render :json => [ @picture.to_jq_upload.merge({ :error => "custom_failure" }) ].to_json }
      end
    end
  end

  # PUT /pictures/1
  # PUT /pictures/1.json
  def update
    @picture = Picture.find(params[:id])

    respond_to do |format|
      if @picture.update_attributes(params[:picture])
        format.html { redirect_to @picture, notice: 'Picture was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy

    @picture = Picture.find(params[:id])
    @picture.destroy

    respond_to do |format|
      format.html { redirect_to pictures_url }
      format.json { render :json => true }
    end
  end
 end