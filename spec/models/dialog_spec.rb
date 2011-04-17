# -*- coding: utf-8 -*-
require 'spec_helper'

describe Dialog do
  fixtures :dialogs, :characters, :faces, :stroies
  before do
    @valid_attributes = {
      :character => characters(:ritsu_tainaka),
      :face => faces(:ritsu_ahegao),
      :story => stories(:ritsu_x_mio),
      :line_num => 2,
      :message => 'ほげほげほげほげ'
    }
  end
  
  describe "#valid?" do
    subject { Dialog.new(@valid_attributes) }
    it { should be_valid }
    describe "[story, line_num]はunique" do
      subject { Dialog.new(@valid_attributes.merge(:line_num => 1)) }
      it { should_not be_valid }
    end
  end
end