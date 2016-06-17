require 'spec_helper'

describe User do

  before(:each) do
    @attr = { :nom => "Example", :password => "test", :email => "user@example.com", :email_confirmation => "user@example.com" }
  end

  it "peut supprimer tous les tests" do
    @users = User.all
    @users.each do |user|
		if user.email=="user@example.com"
			ok = user.destroy
		end
    end
  end

  
  it "devrait créer une nouvelle instance dotée des attributs valides" do
    User.create!(@attr)
  end

  it "exige un nom" do
    bad_guy = User.new(@attr.merge(:nom => ""))
    expect(bad_guy).not_to be_valid 
  end
	
  it "exige un password" do
    bad_guy = User.new(@attr.merge(:password => ""))
    expect(bad_guy).not_to be_valid 
  end

  it "exige un email de confirmation" do
    bad_guy = User.new(@attr.merge(:email_confirmation => ""))
    expect(bad_guy).not_to be_valid 
  end

  # it "exige un password valide" do
    # good_guy = User.new(@attr.merge(:password => "test"))
    # expect(good_guy).to be_valid
  # end

  it "devrait rejeter les noms trop longs" do
    long_nom = "a" * 51
    long_nom_user = User.new(@attr.merge(:nom => long_nom))
    expect(long_nom_user).not_to be_valid
  end  

  it "devrait rejeter une adresse email invalide" do
    adresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    adresses.each do |address|
      invalid_email_user = User.new(@attr.merge(:email => address))
      expect(invalid_email_user).not_to be_valid
    end
  end
  

  describe "relationships" do

    before(:each) do
      @user = User.create!(@attr)
      @followed = Factory(:user)
    end

    it "devrait posséder une méthode `relationships`" do
      @user.should respond_to(:relationships)
    end

    it "devrait posséder une méthode `following" do
      @user.should respond_to(:following)
    end
  end  

  
end