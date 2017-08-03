class Book < ApplicationRecord
  belongs_to :user

  validates :title, :author, :user_id, presence: true

  before_create :set_default_year

  private
  def set_default_year
    self.year ||= Time.now.year
  end 
end
