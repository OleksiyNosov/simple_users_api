require 'rails_helper'
require 'validates_email_format_of/rspec_matcher'

RSpec.describe User, type: :model do
  it { should be_an ApplicationRecord }

  it { should have_many :books }

  it { should validate_presence_of :email }
  
  it { should validate_email_format_of(:email).with_message('is not valid') }
end
