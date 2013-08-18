require 'spec_helper'

describe MongoMapper::TokenKeys do
  let(:doc){ k = Class.new; k.send(:include, MongoMapper::Document); k }

  it 'should be available by default on documents' do
    doc.ancestors.should be_include(MongoMapper::TokenKeys)
  end

  it 'should provide a .token method' do
    doc.should be_respond_to(:token)
  end

  it 'should call through to .key when token is called' do
    doc.should_receive(:key).with(:example, String, {})
    doc.token :example
  end

  it 'should keep track of the token (and any supplied size)' do
    doc.token :first
    doc.token :second, :size => 10

    doc.tokens.should == {:first => MongoMapper::TokenKeys::DEFAULT_SIZE, :second => 10}
  end

  it 'should automatically generate tokens on validation' do
    doc.token :example
    instance = doc.new
    MongoMapper::TokenKeys.should_receive(:generate).with(MongoMapper::TokenKeys::DEFAULT_SIZE).and_return('abc')
    instance.example.should be_nil
    instance.valid?
    instance.example.should == 'abc'
  end
end