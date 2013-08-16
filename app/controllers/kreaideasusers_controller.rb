class KreaideasusersController < ApplicationController
  # GET /kreaideasusers
  # GET /kreaideasusers.json+
  before_filter :get_countries
  def index
    @kreaideasusers = Kreaideasuser.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @kreaideasusers }
    end
  end

  # GET /kreaideasusers/1
  # GET /kreaideasusers/1.json
  def show
    @kreaideasuser = Kreaideasuser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @kreaideasuser }
    end
  end

  # GET /kreaideasusers/new
  # GET /kreaideasusers/new.json
  def new
    @kreaideasuser = Kreaideasuser.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @kreaideasuser }
    end
  end

  # GET /kreaideasusers/1/edit
  def edit
    @kreaideasuser = Kreaideasuser.find(params[:id])
  end

  # POST /kreaideasusers
  # POST /kreaideasusers.json
  def create
    @kreaideasuser = Kreaideasuser.new(kreaideasuser_params)
    @kreaideasuser.points=0
    respond_to do |format|
      if @kreaideasuser.save
        format.html { redirect_to @kreaideasuser, notice: 'El usuario a sido creado.' }
        format.json { render json: @kreaideasuser, status: :created, location: @kreaideasuser }
      else
        format.html { render action: "new" }
        format.json { render json: @kreaideasuser.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kreaideasusers/1
  # PATCH/PUT /kreaideasusers/1.json
  def update
    @kreaideasuser = Kreaideasuser.find(params[:id])

    respond_to do |format|
      if @kreaideasuser.update_attributes(kreaideasuser_params)
        format.html { redirect_to @kreaideasuser, notice: 'El usuario a sido actualizado.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @kreaideasuser.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kreaideasusers/1
  # DELETE /kreaideasusers/1.json
  def destroy
    @kreaideasuser = Kreaideasuser.find(params[:id])
    @kreaideasuser.destroy

    respond_to do |format|
      format.html { redirect_to kreaideasusers_url }
      format.json { head :no_content }
    end
  end

  private

    def get_countries

      @countries = Country.all

    end

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def kreaideasuser_params
      params.require(:kreaideasuser).permit(:name,:email,:address,:phone,:salt,:addresslevel1_id,:points,:hashed_password, :password, :password_confirmation)
    end
end
