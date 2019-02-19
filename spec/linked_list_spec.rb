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
      it 'should have a method, #head, which returns the first node' do
        expect(instance).to respond_to(:head)
        expect(instance.head.value).to eq(init_values.first)
      end
    end

    context '#first' do
      it 'should have a method, #first, which returns the value of the first node' do
        expect(instance.first).to eq(instance.head.value)
      end
    end

    context '#tail' do
      it 'should have a method, #tail, which returns the last node' do
        expect(instance).to respond_to(:tail)
        expect(instance.tail.value).to eq(init_values.last)
      end
    end

    context '#last' do
      it 'should have a method, #last, which returns the value of the last node' do
        expect(instance.last).to eq(instance.tail.value)
      end
    end

    context '#push' do
      it 'should have a method #push' do
        expect(instance).to respond_to(:push)
      end
      it 'should add value(s) to the tail' do
        more_values = [3, 4, 5]
        expect(instance.push(*more_values).last).to eq(more_values.last)
      end

      it 'should accept multiple arguments' do
        expect(instance).to respond_to(:push).with(1).arguments
        expect(instance).to respond_to(:push).with(4).arguments
        expect(instance).to respond_to(:push).with(33).arguments
      end

      it 'should alter the original instance' do
        instance_id = instance.object_id
        expect(instance.push(1).object_id).to eq(instance_id)
      end

      it 'should increase the length of the linked list by the number of values given' do
        length = instance.length
        more_values = [3, 33, 333, 3333]
        expect(instance.push(*more_values).length).to eq(length + more_values.length)
      end
    end

  end
end