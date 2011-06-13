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
    
    it "should set an encrypted password attribute" do
      @user.encrypted_password.should_not be_blank
    end
    
    it "should have an encrypted_password attribute" do
      @user.should respond_to(:encrypted_password)
    end
    
    it "should have a salt" do
      @user.should respond_to(:salt)
    end
  
  
    describe "has_password? method" do
    
      it "should exist" do
        @user.should respond_to(:has_password?)
      end
    
      it "should return true if the passwords match" do
        @user.has_password?(@attr[:password]).should be_true
      end
    
      it "should return false if the passwords don't match" do
        @user.has_password?("invalid").should be_false
      end
    end
    
    describe "authenticate method" do
      
      it "should exist" do
        User.should respond_to(:authenticate)
      end
      
      it "should return nil on email/password mismatch" do
        User.authenticate(@attr[:email], "wrongpass").should be_nil
      end
      
      it "should return nil for an email address with no user" do
        User.authenticate("bar@foo.com", @attr[:password]).should be_nil
      end
      
      it "should return user on email/password match" do
        User.authenticate(@attr[:email], @attr[:password]).should == @user
      end
    end
  end
  
  describe "admin attribute" do
    
    before(:each) do
      @user = User.create!(@attr)
    end
    
    it "should respond to admin" do
      @user.should respond_to(:admin)
    end
    
    it "should not be an admin by default" do
      @user.should_not be_admin
    end
    
    it "should be convertible into an admin" do
      @user.toggle!(:admin)
      @user.should be_admin
    end
    
  end
  
end
