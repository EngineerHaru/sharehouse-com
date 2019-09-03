class Admin::HousesController < ApplicationController
  layout 'admin'
  def index
    @houses = House.all
  end
  
  def new
    @house = House.new
  end
  
  def create
    @house = House.new(house_params)
    if @house.save
      redirect_to admin_houses_path, notice: "物件登録しました。"
    else
      render 'new'
    end
  end

  private
    # Rails4からStrongParamaterと呼ばれる機能が追加されました。
    # セキュリティのため、permitメソッドで許可したパラメータ名しか取得できません。
    def house_params
      params.require(:house).permit(:name, :address, :access, :description, :gender_type)
    end
end