require File.expand_path('spec/spec_helper')

#I've had to mark these tests as pending as they are
#not unstubbing the methods and are making other tests fail.
#Seems to be an rspec issue
describe Shutl do
  describe "#method_missing" do
    let(:config) do
      {   gpg_email: "test@example.com",
          gpg_key_file: "spec/fixtures/test.gpg"}
    end

    #Because there is an ||= assignment on the @properties variable
    #and the Quote::Writer class loads a value from the Shutl class then this
    #variable has been assigned already so we need to reset it
    before(:each) do
      Shutl.instance_eval do
        @properties = nil
      end

      Shutl.stub(:load_properties).and_return config
    end

    after(:each) do
      Shutl.reset_properties
    end

    it "defines the gpg key file" do
      Shutl.gpg_key_file.should == config[:gpg_key_file]
    end

    it "defines the gpg_email" do
      Shutl.gpg_email.should == config[:gpg_email]
    end

    it "raises a method missing error" do
      lambda {Shutl.dog}.should raise_error NoMethodError
    end


    it "reads with indifferent access" do
      Shutl.properties["gpg_email"].should == config[:gpg_email]
    end
  end

  describe "#production_mode?" do

    before(:each) do
      Shutl.instance_eval do
        @production_mode = nil
      end
    end

    it "takes the mode from the properties" do
      properties = {production_mode: true}
      Shutl.stub(:properties).and_return properties
      Shutl.production_mode?.should be_true
    end

    it "uses the rails env if the properies are not set" do
      Shutl.stub(:properties).and_return Hash.new
      Rails.stub_chain(:env, :production?).and_return true
      Shutl.production_mode?.should be_true
    end

    it "uses properties over then environment" do
      properties = {production_mode: false}
      Shutl.stub(:properties).and_return properties
      Rails.stub_chain(:env, :production?).and_return true
      Shutl.production_mode?.should_not be_true
    end
  end

end
