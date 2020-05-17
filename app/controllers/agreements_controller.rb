class AgreementsController < ApplicationController
  # before_action :set_agreement, only: [:show, :edit, :update, :destroy]

  def index
    @q = Agreement.ransack(params[:q])
    @agreements = @q.result(distinct: true).order(service_name: :asc).page(params[:page]).per(5)

    # gon.data2 = []
    # gon.data3 = []
    # gon.data4 = []
    # gon.data5 = []
    # gon.data6 = []
    # gon.data7 = []
    # 12.times do

    # from  = Time.now.at_beginning_of_day
    # to    = (from - 1.month)
    # gon.data = Agreement.where(created_at: from...to).sum(:price)
      # gon.data << Agreement.where(created_at: search_date.in_time_zone.all_month).sum(:price)

      # time = Time.now - 1.month
      # this_month = time.beginning_of_month..time.end_of_month
      # gon.data << Agreement.where(created_at: this_month).sum(:price)

      # gon.data = []
      gon.data2 = []
      gon.data3 = []
      gon.data4 = []
      gon.data5 = []
      gon.data6 = []
      gon.data7 = []


      gon.data = []

      first_month = ''

      t = Time.new

      Agreement.all.each do |a|
        target_month = t.strftime("%m")
          binding.pry
        gon.data[target_month - 1] = gon.data[target_month - 1] + a.price

      end

      # time = Time.now
      # this_month = time.beginning_of_month..time.end_of_month
      # gon.data << Agreement.where(created_at: this_month).sum(:price)
      # gon.data2 << Agreement.all.sum(:price)
      # gon.data3 << Agreement.all.sum(:price)
      # gon.data4 << Agreement.all.sum(:price)
      # gon.data5 << Agreement.all.sum(:price)
      # gon.data6 << Agreement.all.sum(:price)
      # gon.data7 << Agreement.all.sum(:price)
    # end

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
