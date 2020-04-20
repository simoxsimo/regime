class Group < ApplicationRecord
  belongs_to :author, class_name: 'User', optional: true
  has_many :nutriment_groups, class_name: 'NutrimentGroup', foreign_key: 'group_id'
  has_many :nutriments, through: :nutriment_groups, source: :nutriment
  has_one_attached :icon

  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 24 }
  after_save :icon_validation

  def icon_validation
    return unless icon.attached?

    if icon.blob.byte_size > 1_000_000
      icon.purge
    elsif !icon.blob.image?
      icon.purge
    end
  end
end
