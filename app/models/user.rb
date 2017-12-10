class User < ApplicationRecord
  has_secure_password validations: false
  has_many :orders

  validates_confirmation_of :password
  validates :password, :presence => true, :length => { minimum: 6 }, format: { with: /\A(?=.{6,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[[:^alnum:]])/,
    message: "must contain at least 6 characters, a number, a lowercase letter, uppercase letter, a symbol."  }
  validates :email, :presence => true, :uniqueness => true, format: { with: /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/, multiline: true}


  def previous_orders
    self.orders.where(status: 2).includes(order_items: :product)
  end
end
