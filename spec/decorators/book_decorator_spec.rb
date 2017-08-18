require 'rails_helper'

RSpec.describe BookDecorator do
  describe '#as_json' do
    let(:book) { stub_model Book, title: 'Tom Soyer', author: 'Mark Twain', year: 1920, 
      user_id: 1 }

    context do
      subject { book.decorate }

      its([:title]) { should eq 'Tom Soyer' }

      its([:author]) { should eq 'Mark Twain' }

      its([:year]) { should eq 1920 }

      its([:user_id]) { should eq 1 }
    end

    context 'brief' do
      subject { book.decorate(context: { brief: true }) }

      its([:title]) { should eq 'Tom Soyer' }

      its([:author]) { should eq 'Mark Twain' }

      its([:year]) { should eq 1920 }
    end
  end  
end