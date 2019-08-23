class Product < ApplicationRecord
  validates :name, :cost_cents, :inventory, presence: true
  validates :cost_cents, :inventory, numericality: { greater_than: 0 }

  scope :in_stock, -> { where("inventory > ?", 0) }
  scope :out_of_stock, -> { where("inventory <= ?", 0) }

  has_many :order_products
  has many :orders, through: :order_products

  def available?
    inventory > 0
  end

  def reduce_inventory
    update(inventory: inventory - 1)
  end
end
