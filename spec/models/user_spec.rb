require 'spec_helper'

describe User do
  
  before(:each) do
    @attr = { 
              :name => "Example User", 
              :email => "user@example.com",
              :password => "foobar", 
              :password_confirmation => "foobar" 
             }
  end
  
  it "should create a new instance given a valid attribute" do
    User.create!(@attr)
  end
  
  it "should require a name" do
    no_name_user = User.new(@attr.merge(:name => ""))
    no_name_user.should_not be_valid
  end
  
  it "should require an email address" do
    no_email_user = User.new(@attr.merge(:email => ""))
    no_email_user.should_not be_valid
  end
  
  it "should reject the names that are too long" do
    long_name = "a" * 51
    long_name_user = User.new(@attr.merge(:name => long_name))
    long_name_user.should_not be_valid
  end
  
  it "should accept the valid email addresses" do
    addresses = %w[user@example.com THE_USER@example.dot.ru ano.ther@user.jp]
    addresses.each do |address|
      valid_email_user = User.new(@attr.merge(:email => address))
      valid_email_user.should be_valid
    end
  end
  
  it "should reject invalid email addresses" do
    addresses = %w[user@example,com THE_USER_at_no.ru ano.ther@user.]
    addresses.each do |address|
      invalid_email_user = User.new(@attr.merge(:email => address))
      invalid_email_user.should_not be_valid
    end
  end
  
  it "should reject duplicate email addresses" do
    User.create!(@attr)
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end
  
  it "should reject email addresses identical up to case" do
    upcased_email = @attr[:email].upcase
    User.create!(@attr)
    user_with_duplicate_email = User.new(@attr.merge(:email => upcased_email))
    user_with_duplicate_email.should_not be_valid
  end
  
  describe "password" do
    
    before(:each) do
      @user = User.new(@attr)
    end
    
    it "should have a password attribute" do
      @user.should respond_to(:password)
    end
    
    it "should have a password confirmation" do
      @user.should respond_to(:password_confirmation)
    end
  end
  
  describe "password validations" do
    
    it "should require a password" do
      User.new(@attr.merge(:password => "", :password_confirmation => "")).
        should_not be_valid
    end
    
    it "should require a matching password confirmation" do
      User.new(@attr.merge(:password_confirmation => "invalid")).
        should_not be_valid
    end
    
    it "should reject short passwords" do
      short_pass = "a" * 5
      User.new(@attr.merge(:password => short_pass, 
                            :password_confirmation => short_pass)).
                            should_not be_valid
    end
    
    it "should reject long passwords" do
      long_pass = "a" * 41
      User.new(@attr.merge(:password => long_pass, 
                            :password_confirmation => long_pass)).
                            should_not be_valid
    end
  end
  
  describe "password encryption" do
    
    before(:each) do
      @user = User.create!(@attr)
    end
    
    it "should have an encrypted_password attribute" do
      @user.should respond_to(:encrypted_password)
    end
  end
  
end
