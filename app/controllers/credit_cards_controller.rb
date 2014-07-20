class CreditCardsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  respond_to :json, :xml

  def index
      @creditcards = CreditCard.all
  end

  def new

  end

  def update
    @creditcard = CreditCard.find(params[:id])
  end

  def create
    if CreditCard.create(credit_card_params)
      response = {:status => 'Success'}
    else
      errors = [];
      response = {:status => 'Unsuccessful', :errorMessageList => errors}
    end

    respond_to do |format|
      format.json { render :json => response }
    end
  end

  def modify
    credit_card = CreditCard.find(params[:id])

    if credit_card.update_attributes(credit_card_params)
      response = {:status => 'Success'}
    else
      errors = [];
      response = {:status => 'Unsuccessful', :errorMessageList => errors}
    end

    respond_to do |format|
      format.json { render :json => response }
    end
  end

  def destroy
    @creditcard = CreditCard.find(params[:id])
    @creditcard.destroy

    redirect_to :action => :index, :controller => :credit_cards
  end

  def show
    @creditcard = CreditCard.find(params[:id])
  end

  private
    def credit_card_params
      params.require(:credit_card).permit(:user_id, :address_id, :first_name, :last_name, :number, :expiration_month, :expiration_year, :ccv)
    end
end
