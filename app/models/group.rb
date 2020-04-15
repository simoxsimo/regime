class Group < ApplicationRecord
  belongs_to :author, class_name: 'User', optional: true
  has_many :nutriment_groups, class_name: "NutrimentGroup", foreign_key: "group_id"
  has_many :nutriments, through: :nutriment_groups, source: :nutriment
  has_one_attached :icon

  # every author must have a unique name for every group he creates, while it is possible to have the same group name created by diffrent authors
  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: {maximum: 24}
  validate :icon_validation

  private

  def icon_validation
    if icon.attached?
      if icon.blob.byte_size > 1000000
        icon.purge
        flash.now[:danger] = "Your image size is big, try upload one with a less than 1 MB"
      elsif !icon.blob.image?
        icon.purge
        flash.now[:danger] = "Wrong format, please upload an image"
      end
    end   
  end
end
