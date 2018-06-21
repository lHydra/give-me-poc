# frozen_string_literal: true

require 'rails_helper'

describe Developer::Wizard::ProfileForm do
  subject { described_class.new(model) }
  let(:model) { User.new }
  let(:errors) { subject.errors.messages.keys }

  before { subject.validate(params) }

  context 'valid params' do
    let(:params) do
      {
        first_name: 'John',
        last_name: 'Smith',
        location: 'Russia',
        timezone: 'Europe/Moscow',
        cv_url: 'https://google.com',
        role: 'mentor',
        primary_skill_id: 1
      }
    end

    it { expect(errors).not_to include :first_name }
    it { expect(errors).not_to include :last_name }
    it { expect(errors).not_to include :location }
    it { expect(errors).not_to include :timezone }
    it { expect(errors).not_to include :cv_url }
    it { expect(errors).not_to include :role }
    it { expect(errors).not_to include :primary_skill_id }

    it { is_expected.to be_valid }
  end

  context 'invalid params' do
    let(:params) { {} }

    it { expect(errors).to include :first_name }
    it { expect(errors).to include :last_name }
    it { expect(errors).to include :location }
    it { expect(errors).to include :timezone }
    it { expect(errors).to include :cv_url }
    it { expect(errors).to include :role }
    it { expect(errors).to include :primary_skill_id }

    it { is_expected.not_to be_valid }
  end
end
