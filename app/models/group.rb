class Group < ApplicationRecord
  belongs_to :author, class_name: 'User', optional: true
  has_many :nutriment_groups, class_name: "NutrimentGroup", foreign_key: "group_id"
  has_many :nutriments, through: :nutriment_groups, source: :nutriment

  # every author must have a unique name for every group he creates, while it is possible to have the same group name created by diffrent authors
  validates :name, presence: true, uniqueness: { scope: :author_id }, length: {maximum: 24}
  # validates :icon, presence: true
end
