require 'spec_helper'
require 'robot'

describe Robot do

  before :each do
    @robot = Robot.new(1,1,"NORTH")
  end

  context "can turn left" do
    it "faces 'WEST' from 'NORTH'" do
      @robot.turn_left
      expect(@robot.direction).to eq('WEST')
    end

    it "faces 'SOUTH' from 'WEST'" do
      @robot.set(1,1,'WEST')
      @robot.turn_left
      expect(@robot.direction).to eq('SOUTH')
    end
  end

  context "can turn right" do
    it "faces 'EAST' from 'NORTH'" do
      @robot.turn_right
      expect(@robot.direction).to eq('EAST')
    end

    it "faces 'SOUTH' from 'EAST'" do
      @robot.set(1,1,'EAST')
      @robot.turn_right
      expect(@robot.direction).to eq('SOUTH')
    end
  end

  context "can travel" do
    it "travels to 3,3" do
      @robot.set(3,3)
      expect(@robot.pos_x).to eq(3)
      expect(@robot.pos_y).to eq(3)
    end
  end

  context "can report" do
    it "report it's current position" do
      @robot.set(1,2)
      @robot.turn_left
      expect(@robot.report).to eq('1,2,WEST')
    end
  end

end