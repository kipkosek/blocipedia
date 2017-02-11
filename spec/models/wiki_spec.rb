require 'rails_helper'

RSpec.describe Wiki, type: :model do
  let(:user) { create(:user) }
  let(:wiki) { create(:wiki) }

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:body) }
  it { is_expected.to validate_presence_of(:user) }
  it { is_expected.to belong_to(:user) }

  describe "attributes" do
    it "has title, body, and user attributes" do
      expect(wiki).to have_attributes(title: wiki.title, body: wiki.body, user: wiki.user)
    end

    it "is public by default" do
      expect(wiki.private).to be(false)
    end
  end

end
