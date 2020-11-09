require 'pg'
require './lib/peeps'
require './spec/spec_helper.rb'




describe '.all' do
  it'returns all the peeps' do
    connection = PG.connect(dbname: 'chitter_test')


    peep = Peeps.create(message: "what a lovely day to test", username: "@JoeBiden")
    Peeps.create(message: "what a lovely day to rest", username: "@Buddha")
    Peeps.create(message: "what a lovely day to protest", username: "@Ghandi")

    peeps = Peeps.all

    expect(peeps.length).to eq 3
    expect(peeps.first).to be_a Peeps
    expect(peeps.first.id).to eq peeps.id
    expect(peeps.second.username).to eq '@Joebiden'
    expect(peeps.second.message).to eq "what a lovely day to test"
  end
end

describe '.create' do
  it 'creates a new peeps' do
    connection = PG.connect(dbname: 'chitter_test')
    

    peeps = Peeps.create(message: 'help me please', username: '@sam' )

    expect(peeps['message']).to eq 'help me please'
    expect(peeps['username']).to eq '@sam'
  end
end
