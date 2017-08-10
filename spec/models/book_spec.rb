require 'rails_helper'

RSpec.describe Book, type: :model do
  it { should be_an ApplicationRecord }

  it { should belong_to :user }

  it { should validate_presence_of :title }

  it { should validate_presence_of :author }

  describe '#set_default_year' do
    context do
      subject { stub_model Book, year: 2000 }

      before { subject.send :set_default_year }

      its(:year) { should eq 2000 }
    end

    context do 
      before do
        #
        # Time.now.year -> 2007
        #
        expect(Time).to receive(:now) do
          double.tap { |a| expect(a).to receive(:year).and_return(2007) }
        end        
      end

      subject { stub_model Book }

      before { subject.send :set_default_year } 

      its(:year) { should eq 2007 }  
    end
  end
end
