require 'rails_helper' 

RSpec.describe CounterBookJob do
  it { should be_an ApplicationJob }

  its(:queue_name) { should eq 'default' }

  describe '#perform' do
    let(:user) { stub_model User, books_counter: 3 }

    let(:book) { stub_model Book }

    before { expect(User).to receive(:find).with(1).and_return(user) }

    before { expect(user).to receive(:increment!) }

    it { expect { subject.perform 1 }.to_not raise_error }
  end
end