require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  it { should be_an ApplicationMailer }

  describe 'welcome_mail' do
    let(:user) { stub_model User, name: 'Alan', email: 'user@example.com' }

    subject { UserMailer.welcome_mail user }

    its(:from) { should eq ['from@example.com'] }

    its(:to) { should eq ['user@example.com'] }

    its(:subject) { should eq 'Welcome!' }
  end
end
