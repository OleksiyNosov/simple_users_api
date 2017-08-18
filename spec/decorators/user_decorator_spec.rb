require 'rails_helper'

RSpec.describe UserDecorator do 
  describe '#as_json' do
    let(:user) { stub_model User, id: 1, name: 'John', email: 'john@example.com', books_counter: 2 }
    
    subject { user.decorate }

    its([:id]) { should eq 1 }

    its([:name]) { should eq 'John' }
    
    its([:email]) { should eq 'john@example.com' }
    
    its([:books_counter]) { should eq 2 }
    
    its(:books) { should eq user.books.decorate(context: { brief: true }) }
  end
end