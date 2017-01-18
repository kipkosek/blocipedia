require 'rails_helper'
include 'random_data'

RSpec.describe Wiki, type: :model do
let(:user) { create(:user) }
let(:wiki) { create(:wiki) }

it { is_expected.to validate_presence_of(:title) }
it { is_expected.to validate_presence_of(:body) }
it { is_expected.to validate_presence_of(:user) }

describe "attributes" do
  it "has title, body, and user attributes" do
    expect(wiki).to have_attributes(title: wiki.title, body: wiki.body, user: wiki.user)
  end
end

end
