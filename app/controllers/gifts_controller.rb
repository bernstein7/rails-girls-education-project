class GiftsController < ApplicationController
  before_action :set_gift, only: [:show, :edit, :update, :destroy]
  before_action :set_user

  # GET /gifts
  # GET /gifts.json
  def index
    @gifts = @user.gifts
  end

  # GET /gifts/1
  # GET /gifts/1.json
  def show
  end

  # GET /gifts/new
  def new
    @gift = Gift.new
  end

  # GET /gifts/1/edit
  def edit
  end

  # POST /gifts
  # POST /gifts.json
  def create
    @gift = @user.gifts.create(gift_params)

    respond_to do |format|
      if @gift.save
        format.html { redirect_to [@user, @gift], notice: 'Gift was successfully created.' }
        format.json { render :show, status: :created, location: @gift }
      else
        format.html { render :new }
        format.json { render json: @gift.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gifts/1
  # PATCH/PUT /gifts/1.json
  def update
    respond_to do |format|
      if @gift.update(gift_params)
        format.html { redirect_to [@user, @gift], notice: 'Gift was successfully updated.' }
        format.json { render :show, status: :ok, location: @gift }
      else
        format.html { render :edit }
        format.json { render json: @gift.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gifts/1
  # DELETE /gifts/1.json
  def destroy
    @gift.destroy
    respond_to do |format|
      format.html { redirect_to gifts_url, notice: 'Gift was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gift
      @gift = Gift.find(params[:id])
    end


    def set_user
      @user = User.find(params[:user_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gift_params
      params.require(:gift).permit(:descripption, :user_id, :name, :price)
    end
end
