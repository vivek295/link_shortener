require 'rails_helper'

describe Link do

  before(:all) do
    @link = Link.new(:original_url => 'http://www.google.com')
  end

  it "can be instantiated" do
    Link.new.should be_an_instance_of(Link)
  end

  it "should generate trimmed url" do
    @link.trim_url
    expect(@link.trimmed_url).to be == 'google.com'
  end

  it "should generate short url" do
    @link.generate_short_url
    expect(@link.short_url).to be == 'z.go/Z29vZ2x'
  end

end
