class User < ApplicationRecord
  has_many :nutriments, class_name: 'Nutriment', foreign_key: 'author_id', dependent: :destroy
  has_many :groups, class_name: 'Group', foreign_key: 'author_id', dependent: :destroy

  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { in: 4..14 }
  before_save :authentication_case # turn name into lowercase before saving it

  private

  def authentication_case
    name.downcase!
  end
end
