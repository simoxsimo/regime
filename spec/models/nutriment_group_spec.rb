require('rails_helper')

RSpec.describe(NutrimentGroup, type: :model) do
  context 'should have specific column.' do
    it 'has 2 columns of Integer' do
      should have_db_column(:nutriment_id).of_type(:integer)
      should have_db_column(:group_id).of_type(:integer)
    end
    it 'has 2 columns of datetime' do
      should have_db_column(:created_at).of_type(:datetime)
        .with_options(precision: 6, null: false)
      should have_db_column(:updated_at).of_type(:datetime)
        .with_options(precision: 6, null: false)
    end
  end

  context 'Have an index' do
    it do
      should have_db_index(:nutriment_id)
      should have_db_index(:group_id)
    end
  end

  context 'should belong to' do
    it 'nutriment' do
      should belong_to(:nutriment).optional
    end
    it 'group' do
      should belong_to(:group).class_name('Group').optional
    end
  end

  context 'Accept nested attributes' do
    it { should accept_nested_attributes_for(:group) }
  end
end
