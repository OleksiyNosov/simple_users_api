require 'rails_helper' 

RSpec.describe CounterBookJob do
  it { should be_an ApplicationJob }

  its(:queue_name) { should eq 'default' }

  describe '#refresh' do
    let(:user) { stub_model User, book_counter: 3 }

    let(:book) { stub_model Book }

    before { expect(User).to receive(:find).with(1).and_return(user) }

    before { expect(user).to receive(:update).with(book_counter: 4) }

    # expected no Exception but was no given a block
    # it { expect(subject.refresh 1).to_not raise_error }
  end
end