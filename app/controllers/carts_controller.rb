class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy, :update_quantity_in_cart]
  before_action :is_signed_in, only: [:index]


  # GET /carts
  # GET /carts.json
  def add_to_cart

    @carts = Cart.all

    @cart = @carts.where(product_id: params[:id], user_id: current_user.id).first

      if !@cart.nil?
        @cart.quantity += 1

        @cart.save
      else
        @cart = Cart.new

        if @cart.quantity == nil
          @cart.quantity = 0
        end
    
        @cart.product_id = params[:id]
        @cart.user_id = current_user.id
        @cart.quantity += 1
        @cart.save
      end

    redirect_to products_path
  end

  def update_quantity_in_cart
    if current_user.role == "admin"
      @cart.update(cart_params)
    else
      if current_user.id == @cart.user_id
        @cart.update(cart_params)
      end
    end
    redirect_to carts_path
    
  end

  def index
    if current_user.role != "admin"
      @carts = Cart.all
      @carts = @carts.where(user_id: current_user.id).order(:user_id)
    else
      @carts = Cart.all.order(:user_id)
    end
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
  end

  # GET /carts/new
  # def new
  #   @cart = Cart.new
  # end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts
  # POST /carts.json
  def create
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to carts_url, notice: 'Item removed from cart' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    def is_signed_in
      if !user_signed_in?
        redirect_to products_path
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params.require(:cart).permit(:quantity, :user_id, :product_id)
    end
end
