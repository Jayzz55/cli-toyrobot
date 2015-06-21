require 'spec_helper'
require 'world'

describe World do

  before :each do
    @world = World.new
  end

  context 'initialization' do
    it "starts with 5 x 5 table world" do
      expect(@world.width).to eq(5)
      expect(@world.height).to eq(5)
    end
  end

  context "initial robot placement" do
    it "places robot on the table" do
      @world.place(1,1, 'NORTH')
      expect(@world.robot.pos_x).to eq(1)
      expect(@world.robot.pos_y).to eq(1)
      expect(@world.robot.direction).to eq('NORTH')
    end

    it "cannot place robot outside the table world" do
      @world.place(-1,8, 'NORTH')
      expect(@world.robot).to eq(nil)
    end
  end

  context "subsequent robot placement" do
    it "replaces robot on the table" do
      @world.place(1,1, 'NORTH')
      @world.place(2,3, 'SOUTH')
      expect(@world.robot.pos_x).to eq(2)
      expect(@world.robot.pos_y).to eq(3)
      expect(@world.robot.direction).to eq('SOUTH')
    end

    it "cannot replace robot outside the table world" do
      @world.place(1,1, 'NORTH')
      @world.place(-1,8, 'SOUTH')
      expect(@world.robot.pos_x).not_to eq(-1)
      expect(@world.robot.pos_y).not_to eq(8)
      expect(@world.robot.direction).not_to eq('SOUTH')
    end
  end

  context "moves the robot one unit forward in the direction it is currently facing." do
    it "moves the robot from (1,1,EAST) to (2,1,EAST)" do
      @world.place(1,1, 'EAST')
      @world.robot_navigate
      expect(@world.robot.report).to eq('2,1,EAST')
    end

    it "moves the robot from (1,1,SOUTH) to (1,0,SOUTH)" do
      @world.place(1,1, 'SOUTH')
      @world.robot_navigate
      expect(@world.robot.report).to eq('1,0,SOUTH')
    end

    it "will not move outside the table world" do
      @world.place(0,0, 'WEST')
      @world.robot_navigate
      expect(@world.robot.report).to eq('0,0,WEST')
    end
  end

end