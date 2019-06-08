require_relative "../../../trees/bst/bst"
# binding.pry
RSpec.describe 'BST' do
  subject { BST }
  let(:instance) { subject.new() }

  context '::new' do
    it 'should have a .new method' do
      expect(subject).to respond_to(:new).with(0).arguments
    end
  end

  context '#root' do
    it 'should have a root attr_accessor' do
      test_val = "test"
      expect(instance).to respond_to(:root)
      expect{ instance.root = test_val }.not_to raise_error
      expect( instance.root ).to eq(test_val)
    end
  end

  context '#insert' do
    it 'should have an insert method' do
      expect(instance).to respond_to(:insert)
    end

    it 'should set node to root if there are no other nodes' do
      test_val = "test"
      expect(instance.root).to be_nil
      instance.insert(test_val)
      expect(instance.root.val).to eq(test_val)
    end

    it 'should insert multiple nodes in BST pattern' do
      instance.insert(5)
      instance.insert(3)
      instance.insert(1)
      instance.insert(4)
      expect(instance.root.left.left.val).to eq(1)
      expect(instance.root.left.rigth.val).to eq(4)
    end
  end

  context '#remove' do
    it 'should have a #remove method' do
      expect(instance).to respond_to(:remove).with(1).arguments
    end

    it 'should remove a value from the tree' do
      instance.insert(5)
      instance.insert(3)
      instance.insert(3)
      # expect()
    end

  end

  
end
