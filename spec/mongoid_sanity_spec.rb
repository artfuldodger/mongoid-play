require 'rails_helper'

describe 'Mongoid (in)sanity' do
  it 'messes up the query cache with queries like `any?` or `first`' do
    3.times { User.create! }

    query = User.all

    expect(query.any?).to be true
    expect(query.first).to be_a User
    expect(query.count).to eq 3
    expect(query.to_a.count).to eq 3
  end
end
