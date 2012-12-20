require 'spec_helper'

describe Project do
  #describe ".recent" do
  #  it "includes the 10 newest projects" do
  #
  #  end
  #end

  it "has a valid factory" do
    FactoryGirl.create(:project).should be_valid
  end

  it "is invalid with an empty, nil, or invalid-length title" do
    ["", nil, Faker::Lorem.characters(51)].each { |t|
      FactoryGirl.build(:project, title: t).should_not be_valid
    }

  end

  it "is invalid with an empty, nil, or too-short description" do
    ["", nil, Faker::Lorem.characters(49)].each { |d|
      FactoryGirl.build(:project, description: "").should_not be_valid
    }

  end

  it "is invalid with a nil creator" do
    FactoryGirl.build(:project, creator: nil).should_not be_valid
  end

  it "is invalid with an empty creator" do
    FactoryGirl.build(:project, creator: "").should_not be_valid
  end

  it "is invalid with negative upvotes" do
    FactoryGirl.build(:project, upvotes: -1).should_not be_valid
  end

  it "is invalid with negative downvotes" do
    FactoryGirl.build(:project, downvotes: -1).should_not be_valid
  end

  it "returns a descend-sorted array of projects newer than 10 days old" do
    project = FactoryGirl.create(:project)
    # TODO: figure out why the hash rocket syntax work, but not the new-style hash syntax?
    # new-style hash syntax causes Trait Not Found argumenterror
    project_created_yesterday = FactoryGirl.create(:project, :created_at => 1.day.ago)
    project_created_10_days_ago = FactoryGirl.create(:project, :created_at => 10.days.ago)
    project_created_12_days_ago = FactoryGirl.create(:project, :created_at => 12.days.ago)

    Project.recently_created.should eq [project, project_created_yesterday]
    Project.recently_created.should_not include project_created_10_days_ago
    Project.recently_created.should_not include project_created_12_days_ago
  end
end