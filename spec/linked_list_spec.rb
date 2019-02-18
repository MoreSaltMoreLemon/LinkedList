RSpec.describe 'LinkedList' do
  subject { LinkedList }
  let(:init_values) { [1, 2, 3] }
  let(:instance) { subject.new(*init_values) }

  context '::new' do
    it 'responds to .new' do
      expect(subject).to respond_to(:new)
    end

    it 'should accept multiple arguments' do
      expect(subject).to respond_to(:new).with(1).arguments
      expect(subject).to respond_to(:new).with(3).arguments
      expect(subject).to respond_to(:new).with(33).arguments
    end
  end

  context 'methods:' do
    context '#length' do
      it 'should have a length property equal to the number of instantiated with' do
        expect(instance).to respond_to(:length)
        expect(instance.length).to eq(init_values.length)
      end

      it 'should return an integer' do
        expect(instance.length).to be_is_a(Integer)
      end
    end

    context '#head' do
      it 'should have a method, #head, which returns the head node' do
        expect(instance).to respond_to(:head)
      end

      it 'should have an alias method #first' do
        expect(instance.first).to eq(instance.head)
      end
    end

    context '#push' do
      it 'should have a method #push' do
        expect(instance).to respond_to(:push)
      end
      it 'should add value(s) to the tail' do

      end

      it 'should accept multiple arguments' do
        expect(instance).to respond_to(:push).with(1).arguments
        expect(instance).to respond_to(:push).with(4).arguments
        expect(instance).to respond_to(:push).with(33).arguments
      end

      it 'should add multiple arguments in sequence from left to right' do
      end

      it 'should increase the length of the linked list by the number of values given' do
      end
    end

  end
end