class Item < ApplicationRecord
  belongs_to :category
  has_many_attached :images
  attribute :image_ids
  attribute :parent_category
  attribute :child_category

  extend ActiveHash::Associations::ActiveRecordExtensions  
  belongs_to_active_hash :prefecture

  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User", optional: true

  # 商品出品時、編集時のバリデーション
  validates :name, presence: true, length: { maximum: 40 }
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :introduction, presence: true, length: { maximum: 1000 }

  with_options presence: true do
    validates :state
    validates :delivery_fee
    validates :delivery_method
    validates :city
    validates :delivery_days
    validates :category_id
    validates :images
  end

  validate :images_upload_validate
  validate :image_delete_validate

  # 選択肢のenum化
  enum size: {under_XXS: 1, XS: 2, S: 3, M: 4, L: 5, XL: 6, double_XL: 7, triple_XL: 8, over_4XL: 9, FREESIZE: 10}
  enum state: {unused: 1, near_unused: 2, no_dirts: 3, some_dirts: 4, have_dirts: 5, bad_condition: 6}
  enum delivery_fee: {postage_included: 1, cash_on_delivery: 2}
  enum delivery_method: {undecided: 1, mercari: 2, post_office_mail: 3, letter_pack: 4, regular_mail: 5, yamato: 6, post_office_pack: 7, click_post: 8, post_office_packet: 9}
  enum delivery_days: { early: 0, middle: 1, late: 2}
  enum status: { exhibiting: 1, stopping: 2, trading: 3, complete: 4}

  private
  def images_upload_validate
    if images.attached?
      if images.length > 10 
        errors.add(:images, "画像の枚数は最大10枚までです。")
      end
      images.each do |image|
        if !image.content_type.in?(%('image/jpeg image/png'))
          errors.add(:images, "ファイル形式はjpeg, またはpngが使用できます")
        end
      end
    end
  end

  # update時に画像が0枚になってしまったときのバリデーションを設定
  def image_delete_validate
    if image_ids.present?
      # image_idsの初期値は"0"に設定し、「削除」クリック時に値を更新しているので、すべての値が更新されていないかどうかをチェック
      unless image_ids.include?("0")  
        errors.add(:image_ids, "画像がありません")
      end
    end
  end
end
