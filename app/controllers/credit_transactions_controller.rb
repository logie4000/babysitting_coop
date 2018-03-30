class CreditTransactionsController < ApplicationController
  before_action :set_credit_transaction, only: [:show, :edit, :update, :destroy]

  # GET /credit_transactions
  # GET /credit_transactions.json
  def index
    @credit_transactions = CreditTransaction.all
  end

  # GET /credit_transactions/1
  # GET /credit_transactions/1.json
  def show
  end

  # GET /credit_transactions/new
  def new
    @credit_transaction = CreditTransaction.new
  end

  # GET /credit_transactions/1/edit
  def edit
  end

  # POST /credit_transactions
  # POST /credit_transactions.json
  def create
    @credit_transaction = CreditTransaction.new(credit_transaction_params)

    respond_to do |format|
      if @credit_transaction.save
        format.html { redirect_to @credit_transaction, notice: 'Credit transaction was successfully created.' }
        format.json { render :show, status: :created, location: @credit_transaction }
      else
        format.html { render :new }
        format.json { render json: @credit_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /credit_transactions/1
  # PATCH/PUT /credit_transactions/1.json
  def update
    respond_to do |format|
      if @credit_transaction.update(credit_transaction_params)
        format.html { redirect_to @credit_transaction, notice: 'Credit transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @credit_transaction }
      else
        format.html { render :edit }
        format.json { render json: @credit_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /credit_transactions/1
  # DELETE /credit_transactions/1.json
  def destroy
    @credit_transaction.destroy
    respond_to do |format|
      format.html { redirect_to credit_transactions_url, notice: 'Credit transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_credit_transaction
      @credit_transaction = CreditTransaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def credit_transaction_params
      params.fetch(:credit_transaction, {})
    end
end
