class AgreementsController < ApplicationController
  # before_action :set_agreement, only: [:show, :edit, :update, :destroy]

  def index
    @agreements = Agreement.all.order(created_at: :desc)
    @agreements = Agreement.page(params[:page]).per(5)
  end

  def show
    # @agreement = Agreement.find(params[:id])
  end

  def new
    @agreement = Agreement.new
  end

  def create
    agreement = Agreement.new(agreement_params)
    agreement.save!
    redirect_to agreements_url, notice: "「#{agreement.service_name}」を登録しました。"
  end

  def edit
    @agreement = Agreement.find(params[:id])
  end

  def update
    @agreement.update!(agreement_params)
    redirect_to agreements_url, notice: "タスク「#{@agreement.service_name}」を更新しました。"
  end

  def destroy
    agreement = Agreement.find(params[:id])
    # binding.pry
    agreement.destroy
    redirect_to agreements_url, notice: "サービス「#{agreement.service_name}」を削除しました。"
  end

  private

  def agreement_params
    params.require(:agreement).permit(:service_name, :price)
  end

  # def set_agreement
  #   @agreement = Agreement.find(params[:id])
  # end
end
