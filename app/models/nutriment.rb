class Nutriment < ApplicationRecord
  belongs_to :author, class_name: 'User', optional: true
  has_many :nutriment_groups, class_name: "NutrimentGroup", foreign_key: "nutriment_id"
  has_many :groups, through: :nutriment_groups, source: :group

  # every author must have a unique name for every nutriment he creates, while it is possible to have the same nutriment name created by diffrent authors
  validates :name, presence: true, uniqueness: { scope: :author_id }, length: {maximum: 24}
  validates :amount, presence: true, length: {maximum: 15},:numericality => { :greater_than_or_equal_to => 0 }
  accepts_nested_attributes_for :nutriment_groups
end
