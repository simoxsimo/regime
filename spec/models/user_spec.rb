require('rails_helper')

RSpec.describe(User, type: :model) do
  context 'should have specific column. It has' do
    it 'has column of string' do
      should have_db_column(:name).of_type(:string)
    end
    it 'has 2 columns of datetime' do
      should have_db_column(:created_at).of_type(:datetime)
        .with_options(precision: 6, null: false)
      should have_db_column(:updated_at).of_type(:datetime)
        .with_options(precision: 6, null: false)
    end
  end

  context 'should has many' do
    it 'nutriments' do
      should have_many(:nutriments).class_name('Nutriment').with_foreign_key('author_id').dependent(:destroy)
    end
    it 'groups' do
      should have_many(:groups).class_name('Group').with_foreign_key('author_id').dependent(:destroy)
    end
  end
end
