class AgreementsController < ApplicationController
  before_action :set_current_user_agreement, only: [:show, :edit, :update, :destroy]

  def index
    @q = Agreement.where(user_id: current_user.id).ransack(params[:q])
    @agreements = @q.result(distinct: true).order(service_name: :asc).page(params[:page]).per(5)
    @agreements_chart = @q.result(distinct: true)

    sum = 0
    time = Time.now - 1.month
    this_month = time.beginning_of_month..time.end_of_month
    gon.data = []

    @agreements_chart.all.each do |a|
      target_month = a.created_at.strftime("%m").to_i

      gon.data[target_month - 1] = gon.data[target_month - 1].to_i + a.price
    end
  end

  def show
    @agreement = Agreement.find(params[:id])
  end

  def new
    @agreement = Agreement.new
  end

  def create
    @agreement = Agreement.new(agreement_params)
    @agreement.user_id = current_user.id
    @agreement.save
    redirect_to agreements_url, notice: "「#{@agreement.service_name}」を登録しました。"
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
    params.require(:agreement).permit(:service_name, :price, :user_id)
  end

  def set_current_user_agreement
    @agreement = current_user.agreements.find(params[:id])
  end
end
