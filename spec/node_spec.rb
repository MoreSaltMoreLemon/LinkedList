RSpec.describe 'Node' do
  subject { Node }
  let(:instance) { subject.new("value", "next") }

  context '::new' do
    it 'should have a .new method' do
      expect(subject).to respond_to(:new).with(2).arguments
    end

    it 'should accept one or two arguments' do
      expect {subject.new}.to raise_error(ArgumentError)
      expect {subject.new("value")}.not_to raise_error(ArgumentError)
      expect {subject.new("value", "test")}.not_to raise_error(ArgumentError)
    end

    it 'should save the values it was instantiated with' do
      expect(instance.value).to eq("value")
      expect(instance.next).to eq("next")
    end
  end

  context '#value' do
    it 'should return the value it was instantiated with' do
      expect(instance.value).to eq("value")
    end

    it 'should protect the value it was instantiated with from being changed' do
      expect {instance.value = "new value"}.to raise_error(NoMethodError)
    end
  end

  context '#next' do
    it 'should return the next value it was instantiated with' do
      expect(instance.next).to eq("next")
    end

    it 'should allow the next value to be set' do
      expect {instance.next = "new value"}.not_to raise_error
      expect(instance.next).to eq("new value")
    end
  end

  context '#insert' do
    it 'should accept an input' do
      expect(instance).to respond_to(:insert).with(1).arguments
    end

    it 'should insert a value between the given node and the next node' do
      n1 = instance.insert("another value")
      n2 = instance.insert("yet another value")
      next_node = instance.next
      expect(instance.next).to equal(n2)
      expect(instance.next.next).to equal(n1)
    end
  end
end