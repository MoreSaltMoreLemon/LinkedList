require_relative "../../../trees/bst/bst_node"
# binding.pry
RSpec.describe 'BSTNode' do
  subject { BSTNode }
  let(:init_val) { "value" }
  let(:instance) { subject.new(init_val) }

  context '::new' do
    it 'should have a .new method' do
      expect(subject).to respond_to(:new).with(1).arguments
    end
  end

  context 'Properties' do
    it 'should have a parent attr_accessor' do
      test_val = "test"
      expect(instance).to respond_to(:parent)
      expect(instance.parent).to eq(nil)
      expect{ instance.parent = test_val }.not_to raise_error
      expect( instance.parent ).to eq(test_val)
    end
  
    it 'should have a left attr_accessor' do
      test_val = "test"
      expect(instance).to respond_to(:left)
      expect(instance.left).to eq(nil)
      expect{ instance.left = test_val }.not_to raise_error
      expect( instance.left ).to eq(test_val)
    end
  
    it 'should have a right attr_accessor' do
      test_val = "test"
      expect(instance).to respond_to(:right)
      expect(instance.right).to eq(nil)
      expect{ instance.right = test_val }.not_to raise_error
      expect( instance.right ).to eq(test_val)
    end
  
    it 'should have a val attr_accessor' do
      test_val = "test"
      expect(instance).to respond_to(:val)
      expect(instance.val).to eq(init_val)
      expect{ instance.val = test_val }.not_to raise_error
      expect( instance.val ).to eq(test_val)
    end
  end

  context 'methods' do
    context '#push_down' do
      it 'should add a smaller node to the left' do
        node = subject.new(5)
        node.push_down(3)
        expect(node.left.val).to eq(3)
      end
  
      it 'should add a larger node to the right' do
        node = subject.new(5)
        node.push_down(8)
        expect(node.right.val).to eq(8)
      end
    end
  end
end