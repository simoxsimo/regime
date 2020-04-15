require('rails_helper')

RSpec.describe(Nutriment, type: :model) do
  context 'should have specific column.' do
    it 'has column of string' do
      should have_db_column(:name).of_type(:string)
    end
    it 'has 2 columns of Integer' do
      should have_db_column(:amount).of_type(:integer)
      should have_db_column(:author_id).of_type(:integer)
    end
    it 'has 2 columns of datetime' do
      should have_db_column(:created_at).of_type(:datetime)
        .with_options(precision: 6, null: false)
      should have_db_column(:updated_at).of_type(:datetime)
        .with_options(precision: 6, null: false)
    end
  end

  context 'Have an index' do
    it { should have_db_index(:author_id) }
  end

  context 'should has many' do
    it 'nutriments' do
      should have_many(:nutriment_groups).class_name('NutrimentGroup').with_foreign_key('nutriment_id')
    end
    it 'groups' do
        should have_many(:groups).through(:nutriment_groups).source(:group)
    end
  end

  context 'should belong to' do
    it 'author' do
        should belong_to(:author).class_name('User').optional
    end
  end

  context 'Accept nested attributes' do
    it { should accept_nested_attributes_for(:nutriment_groups) }
  end
end