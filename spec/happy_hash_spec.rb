require 'happy_hash'

describe Hash do
  context 'Given a normal hash with string keys' do
    let (:string_hash) { { 'keyA' => 'ValA' } }
    it 'returns a new hash with the keys as symbols' do
      string_hash.happy_hash.should == { key_a: 'ValA' }
    end
  end

  context 'Given a normal hash with string keys' do
    let (:string_hash) { { 'keyA' => 'ValA' } }
    it 'will return a hash that ignores capitals, and doesnt underscore keys' do
      string_hash.happy_hash(true).should == { keyA: 'ValA' }
    end
  end

  context 'Given hashes containing arrays containing hashes' do
    let(:hash) { {'keyA' => [ {'SomeKey' => 'SomeVal'}, {"AnotherKey" => "anotherVal"} ] } }
    it 'will fix all hashes, not just top level ones' do
      hash.happy_hash.should == { key_a: [ { some_key: 'SomeVal' }, { another_key: 'anotherVal' } ] }
    end
  end
end

