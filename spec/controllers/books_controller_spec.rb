require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  it { should be_an ApplicationController }

  describe '#create' do
    let(:book_params) { { title: 'Tom Soyer', author: "Mark Twain", year: '1920' } }

    let(:params) { { book: book_params, user_id: '1' } }

    let(:book) { stub_model Book }

    let(:parent) { stub_model User }

    before { expect(User).to receive(:find).with('1').and_return(parent) }

    before do
      #
      # parent.books.build -> :book
      #
      expect(parent).to receive(:books) do
        double.tap { |a| expect(a).to receive(:build).with(permit! book_params).and_return(book) }
      end
    end

    before { expect(book).to receive(:save!) }

   
    before { process :create, method: :post, params: params, format: :json }

    it { should render_template :create }
  end

  describe '#parent' do
    before do
      #
      # subject.parent.books -> :books
      #
      expect(subject).to receive(:parent) do
        double.tap { |a| expect(a).to receive(:books).and_return(:books) }
      end
    end
  end
end