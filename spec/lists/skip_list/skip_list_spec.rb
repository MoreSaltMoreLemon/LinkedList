require 'pry'
require_relative "../../../lists/linked_list/skip_list/skip_list"
# binding.pry
RSpec.describe 'SkipList' do
  subject { SkipList }
  let(:instance) { subject.new("value") }

  context '::new' do
    it 'should have a .new method' do
      expect(subject).to respond_to(:new).with(1).arguments
    end

    it 'should accept multiple values'

    it 'should build a skip list from an array'
  end

  context '#insert' do
    it 'should have an #insert method' do
      expect(instance).to respond_to(:insert).with(1).argument
    end

    it 'should insert a value into the skip list' do
    end
  end

  context '#find' do
  end

  context '#to_s' do
  end

end