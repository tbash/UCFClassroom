class MessengesController < ApplicationController
  before_action :set_messenge, only: [:show, :edit, :update, :destroy]

  # GET /messenges
  # GET /messenges.json
  def index
    @messenges = Messenge.all
  end

  # GET /messenges/1
  # GET /messenges/1.json
  def show
  end

  # GET /messenges/new
  def new
    @messenge = Messenge.new
  end

  # GET /messenges/1/edit
  def edit
  end

  # POST /messenges
  # POST /messenges.json
  def create
    @messenge = Messenge.new(messenge_params)

    respond_to do |format|
      if @messenge.save
        format.html { redirect_to @messenge, notice: 'Messenge was successfully created.' }
        format.json { render :show, status: :created, location: @messenge }
      else
        format.html { render :new }
        format.json { render json: @messenge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messenges/1
  # PATCH/PUT /messenges/1.json
  def update
    respond_to do |format|
      if @messenge.update(messenge_params)
        format.html { redirect_to @messenge, notice: 'Messenge was successfully updated.' }
        format.json { render :show, status: :ok, location: @messenge }
      else
        format.html { render :edit }
        format.json { render json: @messenge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messenges/1
  # DELETE /messenges/1.json
  def destroy
    @messenge.destroy
    respond_to do |format|
      format.html { redirect_to messenges_url, notice: 'Messenge was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_messenge
      @messenge = Messenge.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def messenge_params
      params.require(:messenge).permit(:sender, :content)
    end
end
