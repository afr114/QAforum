require 'rails_helper'


def log_in (user)
  visit login_path
  fill_in "Email",    with: user.email
  fill_in "Password", with: user.password
  save_and_open_page
  click_button "Submit"
end

describe "the user asking question process" do

  # user = FactoryGirl.create(:user)


  it "asking a new question" do
    user = User.create(:name => "user1", :email => "example@example.com", :password => "password", :password_confirmation => "password")
    log_in user
    visit root_url
    click_link "Ask Question"
    fill_in "Title", with: "Title"
    fill_in "Content", with: "Content"
    click_button "Submit"
    expect(page).to_not have_content("errors")
    ActionMailer::Base.deliveries.count.should == 1
  end

  it "submitting a new answer" do
    user = User.create(:name => "user1", :email => "example@example.com", :password => "password", :password_confirmation => "password")
    question = Question.create(:title => "This is annoying", :content => "Hope this works", user: user)
    log_in user
    visit question_path(question)
    fill_in "Content", with: "Your question sucks!"
    click_button "Answer"
    expect(page).to have_content("Your question sucks!")
    # ActionMailer::Base.deliveries.count.should == 2
  end

end
