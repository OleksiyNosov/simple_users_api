require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  it { should be_an ApplicationController }

  describe '#index' do
    let(:params) { { user_id: '1' } }

    before { process :index, method: :get, params: params, format: :json }

    it { should render_template :index }
  end

  describe '#show' do
    let(:params) { { id: '1', user_id: '1' } }

    let(:book) { stub_model Book }

    let(:parent) { stub_model User }

    before { expect(User).to receive(:find).with('1').and_return(parent) }

    before do
      #
      # parent.books.find -> book
      #
      expect(parent).to receive(:books) do
        double.tap { |a| expect(a).to receive(:find).with('1').and_return(book) }
      end
    end

    before { process :show, method: :get, params: params, format: :json }

    it { should render_template :show }
  end

  describe '#create' do
    let(:book_params) { { title: 'Tom Soyer', author: "Mark Twain", year: '1920' } }

    let(:params) { { book: book_params, user_id: '1' } }

    let(:book) { stub_model Book }

    let(:parent) { stub_model User }

    before { expect(User).to receive(:find).with('1').and_return(parent) }

    before do
      #
      # parent.books.build -> book
      #
      expect(parent).to receive(:books) do
        double.tap { |a| expect(a).to receive(:build).with(permit! book_params).and_return(book) }
      end
    end

    before { expect(book).to receive(:save!) }
   
    before { process :create, method: :post, params: params, format: :json }

    it { should render_template :create }
  end

  describe '#update' do
    let(:book_params) { { title: 'Tom Soyer', author: "Mark Twain", year: '1920' } }

    let(:params) { { book: book_params, id: '1', user_id: '1' } }

    let(:book) { stub_model Book }

    let(:parent) { stub_model User }

    before { expect(User).to receive(:find).with('1').and_return(parent) }

    before do
      #
      # parent.books.find -> book
      #
      expect(parent).to receive(:books) do
        double.tap { |a| expect(a).to receive(:find).with('1').and_return(book) }
      end
    end

    before { expect(book).to receive(:update!) }

    before { process :update, method: :post, params: params, format: :json }

    it { should render_template :update }
  end

  describe '#destroy' do
    let(:params) { { id: '1', user_id: '1' } }

    let(:book) { stub_model Book }

    let(:parent) { stub_model User }

    before { expect(User).to receive(:find).with('1').and_return(parent) }

    before do
      #
      # parent.books.find -> book
      #
      expect(parent).to receive(:books) do
        double.tap { |a| expect(a).to receive(:find).and_return(book) }
      end
    end

    before { expect(book).to receive(:destroy!) }

    before { process :destroy, method: :delete, params: params, format: :json }

    it { should render_template :destroy }
  end
end