require_relative "../../../lists/linked_list/skip_list/skip_list_node"

RSpec.describe 'SkipListNode' do
  subject { SkipListNode }
  let(:instance) { subject.new("value") }

  context '::new' do
    it 'should have a .new method' do
      expect(subject).to respond_to(:new).with(1).arguments
    end

    it 'should save the value it was instantiated with' do
      expect(instance.value).to eq("value")
    end
  end

  context '#next' do
    it 'should have a #next method' do
      expect(instance).to respond_to(:next)
    end
    
    it 'should store new nodes' do
      new_node = subject.new("test")
      instance.next = new_node
      expect(instance.next).to equal(new_node)
    end

    it 'should reject incorrect values' do
      expect{instance.next = "test"}.to raise_error(TypeError)
    end
  end

  context '#lane_next' do
    it 'should have a #lane_next method' do
      expect(instance).to respond_to(:lane_next)
    end

    it 'should accept the next node at nth level' do
      new_node = subject.new("test")
      expect{ instance.lane_next(0, new_node) }.not_to raise_error
    end

    it 'should return the next node at nth level' do
      level = 0
      new_node = subject.new("test")
      instance.lane_next(level, new_node)
      expect(instance.lane_next(level)).to equal(new_node)
    end
  end

end