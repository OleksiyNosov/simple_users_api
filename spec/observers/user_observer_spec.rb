require 'rails_helper'

RSpec.describe UserObserver do
  describe '#after_create' do
    let(:user) { stub_model(User).as_new_record }

    before { expect(UserMailer).to receive(:welcome_mail).with(:user) }
  end
end