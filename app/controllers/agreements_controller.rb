class AgreementsController < ApplicationController
  # before_action :set_agreement, only: [:show, :edit, :update, :destroy]

  def index
    @q = Agreement.ransack(params[:q])
    @agreements = @q.result(distinct: true).order(service_name: :asc).page(params[:page]).per(5)
    gon.data = []
    12.times do
      gon.data << Agreement.all.sum(:price)
    end
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
    @agreement = Agreement.find(params[:id])
    @agreement.update!(agreement_params)
    redirect_to agreements_url, notice: "タスク「#{@agreement.service_name}」を更新しました。"
  end

  def destroy
    agreement = Agreement.find(params[:id])
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
