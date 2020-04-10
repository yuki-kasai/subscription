class AgreementsController < ApplicationController
  def index
    @agreements = Agreement.all
  end

  def show
  end

  def new
    @agreement = Agreement.new
  end

  def create
    agreement = Agreement.new(agreement_params)
    agreement.save!
    redirect_to agreements_url, notice: "「#{agreement.servise_name}」を登録しました。"
  end

  def edit
    @agreement = Agreement.find(params[:id])
  end

  def update
    agreement = Agreement.find(params[:id])
    agreement.update!(agreement_params)
    redirect_to agreements_url, notice: "タスク「#{agreement.servise_name}」を更新しました。"
  end

  def destroy
    agreement = Agreement.find(params[:id])
    agreement.destroy
    redirect_to agreement_url, notice: "サービス「#{agreement.servise_name}」を削除しました。"
  end

  private

  def agreement_params
    params.require(:agreement).permit(:servise_name, :price)
  end
end
