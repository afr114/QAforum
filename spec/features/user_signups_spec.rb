require 'rails_helper'

describe "the signup process" do

  describe "when passing in invalid information" do
    it "should return errors and render current page" do
      visit signup_path
      fill_in "Name",         with: " "
      fill_in "Email",        with: "aslknf"
      fill_in "Password",     with: "pass"
      fill_in "Confirmation", with: "asdfa"
      click_button "Create my account"
      expect(page).to have_content("errors")
    end
  end

  describe "when passing in valid information" do
    it "should save the user to the database and redirect to profile" do
      visit signup_path
      fill_in "Name",         with: "Example User"
      fill_in "Email",        with: "user@example.com"
      fill_in "Password",     with: "password"
      fill_in "Confirmation", with: "password"
      click_button "Create my account"
      expect(page).to_not have_content("errors")
    end

    it "should send an email" do
      ActionMailer::Base.deliveries.count.should == 1
    end

    it "should send an email to the correct user" do
      ActionMailer::Base.deliveries.first.to.should == ["user@example.com"]
    end

    # Pending
    # it "should come from the correct address" do
    # 	ActionMailer::Base.deliveries.first.from.should ==
    # end

    # Pending
    # it 'should set the subject to the correct subject' do
    #   ActionMailer::Base.deliveries.first.subject.should == 'Welcome!'
    # end

  end
end
