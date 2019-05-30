RSpec.describe 'Node' do
  subject { Node }
  let(:instance) { subject.new("value") }

  context '::new' do
    it 'should have a .new method' do
      expect(subject).to respond_to(:new).with(1).arguments
    end

    it 'should save the value it was instantiated with' do
      expect(instance.value).to eq("value")
    end
  end

end