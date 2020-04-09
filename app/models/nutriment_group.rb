class NutrimentGroup < ApplicationRecord
    belongs_to :nutriment, class_name: 'Nutriment', optional: true
    belongs_to :group, class_name: 'Group', optional: true
end
