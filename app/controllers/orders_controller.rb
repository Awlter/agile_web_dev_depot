class OrdersController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:new, :create]
  before_action :ensure_cart_isnt_empty, only: :new

  def new

  end

  private

  def ensure_cart_isnt_empty
    if @cart.line_items.empty?
      redirect_to store_index_url, notice: 'Your cart is empty.'
    end
  end 
end
