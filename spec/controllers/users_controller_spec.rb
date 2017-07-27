require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe '#index' do
    before { process :index, method: :get, format: :json }

    it { should render_template :index }
  end

  describe '#collection' do
    context do
      before { expect(User).to  receive(:all).and_return(:collection) }

      its(:collection) { should eq :collection }
    end
  end

  describe '#create' do
    let(:params) { { name: 'Sam' } }

    let(:user) { stub_model User }

    before { expect(User).to receive(:new).with(permit! params).and_return(user) }

    before { expect(user).to receive(:save!) }

    before { process :create, method: :post, params: params, format: :json }

    it { should render_template :create }
  end
end