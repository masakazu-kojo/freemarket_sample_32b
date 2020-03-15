class ApplicationController < ActionController::Base
  # before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  def after_sign_out_path_for(resource)
    # サインアウト後のリダイレクト先
    new_user_session_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, identity_attributes:[:id, :familyname, :firstname, :familyname_kana, :firstname_kana, :birthday]])
  end


  # private

  # def production?
  #   Rails.env.production?
  # end

  # def basic_auth
  #   authenticate_or_request_with_http_basic do |username, password|
  #   username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
  # end
  
  # itemsからbrandを引き出し重複をなくすメソッド
  def category_brands(items)
    brands = []
    items.each do |item|
      if item[:brand_id].present?
        brands << {id: item[:brand_id], name: Brand.find(item[:brand_id]).name}
      end
    end
    brands.uniq!(&:first)
    return brands
  end
  # itemsからbrandの頭文字を取得し重複を削除
  def initial_index(items)
    initials = []
    items.each do |item|
      if item[:brand_id].present?
        initials << {initial: Brand.find(item[:brand_id]).name.slice(0),id: item[:brand_id] }
      end
    end
    initials.uniq!(&:first)
    return initials
  end
  # itemsから所属するcategorysの配列を取得、重複は削除
  def items_category(items)
    categorys = []
    items.each do |item|
      categorys << {id: item[:category_id], name: Category.find(item[:category_id]).name}
    end
    categorys.uniq!(&:first)
    return categorys
  end
  # categorysのitems配列を作成
  def category_items_index(category_ids)
    items = []
    category_ids.each do |category_id|
      @category_brand_items = Item.where(category_id: category_id)
      @category_brand_items.each do |item|
        items << item
      end
    end
    return items
  end
  # categorysとbrandのitems配列を作成
  def category_items_show(category_ids, brand_id)
    items = []
    category_ids.each do |category_id|
      @category_brand_items = Item.where(category_id: category_id,brand_id: brand_id)
      @category_brand_items.each do |item|
        items << item
      end
    end
    return items
  end

  # categoryによって１、２、３の分類分けをしてitems配列作成
  def selected_category_items(category)
    selected_items = []
    if category.id <= 13
      categorys = category.indirects
      categorys.each do |category|
        items = Item.where(category_id: category.id)
        items.each do |item|
          selected_items << item
        end
      end
    elsif category.id >= 100 && category.id < 10000
      categorys = category.children
      categorys.each do |category|
        items = Item.where(category_id: category.id)
        items.each do |item|
          selected_items << item
        end
      end
    else
      items = Item.where(category_id: category.id)
      selected_items = items
    end
    return selected_items
  end

end
