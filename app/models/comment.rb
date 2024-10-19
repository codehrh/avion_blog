class Comment < ApplicationRecord
  include Visible

  validates :commenter, presence: true
  validates :body, presence: true, length: { minimum: 5 }

  belongs_to :article
end
