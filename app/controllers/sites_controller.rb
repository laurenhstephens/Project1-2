class SitesController < ApplicationController
  # GET /sites
  # GET /sites.json

  def index
    @sites = Site.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sites }
    end
  end
  def set_cors_headers
    headers["Access-Control-Allow-Origin"] = "*"
    headers["Access-Control-Allow-Methods"] = "POST, GET, OPTIONS"
    headers["Access-Control-Allow-Headers"] = "Content-Type, Origin, Referer, User-Agent"
    headers["Access-Control-Max-Age"] = "3600"
  end

  def visits_preflight
    set_cors_headers
    render :text => "", :content_type => "text/plain"
  end 
  # GET /sites/id/visits
  # GET /sites/id/visits.json
  def visits
    set_cors_headers
    @site = Site.where("key =?", params[:id]).first
    if @site.nil?
    else
      @site.create_user_session(Time.now,params[:page], params[:duration])
    end
  end

  # GET /sites/1
  # GET /sites/1.json
  def show
    @site = Site.where(:key => params[:id]).first

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @site }
    end
  end

  # GET /sites/new
  # GET /sites/new.json
  def new
    @site = Site.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @site }
    end
  end

  # GET /sites/1/edit
  def edit
    @site = Site.find(params[:id])
  end

  # POST /sites
  # POST /sites.json
  def create
    @site = Site.new(params[:site])

    respond_to do |format|
      if @site.save
        format.html { redirect_to @site, notice: 'Site was successfully created.' }
        format.json { render json: @site, status: :created, location: @site }
      else
        format.html { render action: "new" }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sites/1
  # PUT /sites/1.json
  def update
    @site = Site.find(params[:id])

    respond_to do |format|
      if @site.update_attributes(params[:site])
        format.html { redirect_to @site, notice: 'Site was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sites/1
  # DELETE /sites/1.json
  def destroy
    @site = Site.find(params[:id])
    @site.destroy

    respond_to do |format|
      format.html { redirect_to sites_url }
      format.json { head :no_content }
    end
  end
end
