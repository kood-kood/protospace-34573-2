class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :prototype

  validates :text, presence: true
  # , unless: :was_attached?

  # def was_attached?
  #   self.image.attached?
  # end
  
end
