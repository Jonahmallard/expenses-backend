class TransactionsController < ApplicationController
    before_action :set_account

    def index
        @transactions = Transaction.all
        render json: @account.transactions
    end

    def show
        @transaction = Transaction.find(params[:id])
        render json: @transaction
    end

    def create
        @transaction = @account.transaction.new(transaction_params)
        if @account.update_balance(@transaction) != 'Balance too low.'
            @transaction.save
            render json: @transaction
        else
            render json: {error: 'Balance too low'}
        end
    end

    def destroy
    #   @transaction = Transaction.find(params[:id])
    #   @transaction.destroy
    end

    private

    def set_account
        @account = Account.find(params[:account_id])
    end

    def transaction_params
        params.require(:transaction).permit(:amount, :account_id, :kind, :date, :description) 
    end
end
