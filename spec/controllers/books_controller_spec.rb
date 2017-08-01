require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  describe '#create' do
    let(:params) { { title: 'Tom Soyer', author: "Mark Twain", year: 1920, user_id: 1 } }

    let(:book) { stub_model Book }

    before { expect(Book).to receive(:new).with(permit! params).and_return(book) }

    before { expect(book).to receive(:save!) }

    before { process :create, method: :post, params: params, format: :json }

    it { should render_template :create }
  end
end