class User < ApplicationRecord
  include ActiveModel::Validations

  validates :name, presence: true, uniqueness: true
  validates :phone, uniqueness: true, phone_number: true
  has_secure_password

  after_destroy :ensure_an_admin_remains

  class Error < StandardError; end

  private

  def ensure_an_admin_remains
    if User.count.zero?
      raise Error.new "Can't delete last user."
    end
  end
end
