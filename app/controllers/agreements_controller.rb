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
  end

  private

  def agreement_params
    params.require(:agreement).permit(:servise_name, :price)
  end
end
