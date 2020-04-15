class NutrimentGroup < ApplicationRecord
    belongs_to :nutriment, class_name: 'Nutriment', optional: true
    belongs_to :group, class_name: 'Group', optional: true
    validates :nutriment_id, presence: true, uniqueness: { scope: :group_id }
    validates :group_id, presence: true
    accepts_nested_attributes_for :group

    def self.relationship(group_id, nutriment_id)
        create(group_id: group_id, nutriment_id: nutriment_id)
    end
end
