require 'spec_helper'

describe Search do

   let(:valid_search_attributes) { FactoryGirl.attributes_for(:search) }
   let(:search) { FactoryGirl.create(:search) }

  subject { @search }
  
end