class TopsController < ApplicationController

    def index
        @ladyitems = get_items(1)
        @menitems = get_items(2)
        @babyitems = get_items(3)
        @interioritems = get_items(4)
    end

private
  def get_items(id)
    # Categoriesテーブルの親のidを取得。idは指定せず引数で指定する。indexアクションでid番号を持たせる。
    category = Category.find(id)
    # indirect_idsメソッドを使って、親のidにヒットする子孫idを取得する処理(もしidが1(レディース)の場合、Categoriesテーブルの1(レディース)に紐づく全ての値(子供と孫のidとその値)を取得できる。
    categories = category.indirect_ids
    # 変数itemsに、Itemsテーブルのcategory_idにヒットするidと値を取得する。
    items = Item.where(category_id: categories).order('id DESC').limit(4)
  end
end