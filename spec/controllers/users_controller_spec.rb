require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe '#index' do
    before { process :index, method: :get, format: :json }

    it { should render_template :index }
  end

  describe '#resourse' do
    before { expect(User).to receive(:find).and_return(:resource) }

    its(:resource) { should eq :resource }
  end

  describe '#collection' do
    before { expect(User).to  receive(:all).and_return(:collection) }

    its(:collection) { should eq :collection }
  end

  describe '#create' do
    let(:params) { { name: 'Sam' } }

    let(:user) { stub_model User }

    before { expect(User).to receive(:new).with(permit! params).and_return(user) }

    before { expect(user).to receive(:save!) }

    before { process :create, method: :post, params: params, format: :json }

    it { should render_template :create }
  end

  describe '#update' do
    let(:params) { { name: 'NewName' } }

    let(:user) { stub_model User }

    before { expect(User).to receive(:find).and_return(user) }

    before { expect(user).to receive(:update!).with(permit! params) }

    before { process :update, method: :patch, params: params.merge(id: 1), format: :json }

    it { should render_template :update }
  end

  describe '#destroy' do
    let(:params) { { id: 1 } }

    let(:user) { stub_model User }

    before { expect(User).to receive(:find).and_return(user) }

    before { expect(user).to receive(:destroy!) }

    before { process :destroy, method: :delete, params: params, format: :json }

    it { should render_template :destroy }
  end
end