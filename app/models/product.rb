class Product < ApplicationRecord
  has_many :order_items

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100#" }, default_url: ":style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  validates :name, :description, :price, presence: true
end
