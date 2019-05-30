require 'pry'

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

    context '#pop' do
      it 'should have a method, #pop' do
        expect(instance).to respond_to(:pop)
      end

      it 'should decrease the length 1' do
        length = instance.length
        instance.pop
        expect(instance.length).to eq(length - 1)
      end
    end

    context '#unshift' do
      it 'should have a method #unshift' do
        expect(instance).to respond_to(:unshift)
      end
      it 'should add value(s) to the head' do
        more_values = [3, 4, 5]
        expect(instance.unshift(*more_values).first).to eq(more_values.first)
      end

      it 'should accept multiple arguments' do
        expect(instance).to respond_to(:unshift).with(1).arguments
        expect(instance).to respond_to(:unshift).with(4).arguments
        expect(instance).to respond_to(:unshift).with(33).arguments
      end

      it 'should alter the original instance' do
        instance_id = instance.object_id
        expect(instance.unshift(1).object_id).to eq(instance_id)
      end

      it 'should increase the length of the linked list by the number of values given' do
        length = instance.length
        more_values = [3, 33, 333, 3333]
        expect(instance.unshift(*more_values).length).to eq(length + more_values.length)
      end
    end

    context '#shift' do
      it 'should have a method, #shift' do
        expect(instance).to respond_to(:shift)
      end

      it 'should decrease the length by the number of values shifted' do
        length = instance.length
        instance.shift
        expect(instance.length).to eq(length - 1)
        instance.shift(2)
        expect(instance.length).to eq(length - 3)
      end

      it 'should accept a range or an positive integer value' do
        expect(instance).to respond_to(:shift)
        expect(instance).to respond_to(:shift).with(1).arguments
        expect { instance.shift(2) }.not_to raise_error
        expect { instance.shift(2.0) }.to raise_error(TypeError)
        expect { instance.shift("2") }.to raise_error(TypeError)
        expect { instance.shift(nil) }.to raise_error(TypeError)
        expect { instance.shift(true) }.to raise_error(TypeError)
        expect { instance.shift(-1) }.to raise_error(RangeError)
      end
    end

    context '#each' do
      it 'should have a method #each' do
        expect(instance).to respond_to(:each)
      end

      it 'should apply a block to each value in the collection' do
        test = []
        answer = [1, 2, 3]
        instance.each {|v| test << v}
        expect(test).to eq(answer)
      end

      it 'should return itself after iterating through the collection' do
        instance_id = instance.object_id
        expect(instance.each {|v| v}.object_id).to eq(instance_id)
      end
    end

    context '#to_a' do
      it 'should have a method #to_a' do
        expect(instance).to respond_to(:to_a)
      end

      it 'should return an array' do
        expect(instance.to_a.kind_of?(Array)).to be(true)
      end

      it 'should return an array matching the values of the list' do
        expect(instance.to_a).to eq(init_values)
      end

      it 'should return an empty array if there are no list nodes' do
        empty = subject.new()
        expect(empty.to_a).to eq([])
      end
    end

    context '#to_s' do
      it 'should return a string' do
        expect(instance.to_s.class).to be(String)
      end

      it 'should use the format \[v1 > v2 > v3 \]' do
        expect(subject.new(1, 2, 3).to_s).to eq("\[1 > 1 > 2 > 3\]")
      end
    end
  end
end