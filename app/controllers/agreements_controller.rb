class AgreementsController < ApplicationController
  # before_action :set_agreement, only: [:show, :edit, :update, :destroy]

  def index
    @q = Agreement.ransack(params[:q])
    @agreements = @q.result(distinct: true).order(service_name: :asc).page(params[:page]).per(5)

    # 12.times do

    # from  = Time.now.at_beginning_of_day
    # to    = (from - 1.month)
    # gon.data = Agreement.where(created_at: from...to).sum(:price)
    # gon.data << Agreement.where(created_at: search_date.in_time_zone.all_month).sum(:price)

      # time = Time.now - 1.month
      # this_month = time.beginning_of_month..time.end_of_month
      # gon.data << Agreement.where(created_at: this_month).sum(:price)

      # gon.data = []
      # labels = { 0: "1月", 1: "2月", 2: "3月", 3: "4月", 4: "5月", 5: "6月", 6: "7月", 7: "8月", 8: "9月", 9: "10月",10: "11月", 11: "12月" }

      # first_month = '2020-04-01'

      # t = Time.new
      #
      # gon.data = []
      #
      # sum = 0
      # gon.bardata = []
      # gon.linedata = []
      #
      # 12.times do |i|
      #   # 月の合計金額
      #
      #   data = rand(100.0)
      #   gon.data << data
      #   # 毎月の合計金額
      #   gon.bardata << data
      #   sum = sum + data
      #   gon.linedata << sum
      # end

      sum = 0
      time = Time.now - 1.month
      this_month = time.beginning_of_month..time.end_of_month
      first_month = ''
      # array = []
      # array = Agreement.where(created_at: this_month).split("")

#       Agreement.all.each do |i|
#         gon.data = []
#         # 取得月のデータの合計金額
#         # target_month = a.created_at.strftime("%m")
#         # target_month = target_month.to_i
#         # gon.data[target_month - 1] = gon.data[target_month - 1] + Agreement.where(created_at: this_month).sum(:price)
#           target_month = i.price
#           sum = sum + target_month
#           gon.data.unshift(sum)
# binding.pry
#       end

sum = 0
time = Time.now - 1.month
this_month = time.beginning_of_month..time.end_of_month
gon.data = []
first_month = 0

Agreement.where(created_at: this_month).each do |a|
  target_month = a.created_at.strftime("%m")
  target_month = target_month.to_i
  sum = sum + a.price
  gon.data[target_month - 1] = sum
  gon.data[target_month] = Agreement.sum(:price)

  first_month = [first_month, target_month].min
end

# binding.pry
      # array = [50000, 10000, 20000]

# binding.pry
      # aのインスタンスのcreated_atの月のみを取得する
      # target_month = a.created_at.strftime("%m")
      # target_month = target_month.to_i
      # binding.pry
      # gon.data[target_month - 1] = gon.data[target_month - 1] + a.price
      # # 最小月を随時更新
      # first_month = [first_month, target_month].min

      # Agreement.all.each do |a|
      #   target_month = a.created_at
      #   target_month = target_month.beginning_of_month..target_month.end_of_month
      #   binding.pry
      #
      #   target_month = target_month.to_i
      #   Agreement.where(created_at: a.created_at.strftime("%m")).sum(:price)
      #   gon.data << a.price
      #
      #   # gon.data[target_month - 1] = gon.data[target_month - 1] << a.price
      # end
        # binding.pry
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
