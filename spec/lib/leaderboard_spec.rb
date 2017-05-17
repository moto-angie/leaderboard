require 'spec_helper'

RSpec.describe Leaderboard do
let(:new_board) { Leaderboard.new }
  describe ".new" do
    it "creates a team object with only team name" do
      expect(new_board).to be_a(Leaderboard)
    end

    it "fills up the teams array" do
      expect(new_board.teams).not_to be_empty
    end
  end

  describe ".create_team_objects" do
    it "creates team objects from team strings" do
      expect(new_board.teams.first).to be_a(Team)
    end
  end

  describe ".wins_losses" do
    it "assigns the proper wins and losses to each team" do
      expect(new_board.teams[0].wins).not_to be_nil
    end
  end

  describe ".rank" do
    it "assigns rank to each team" do
      expect(new_board.teams[0].rank).not_to be_nil
    end
  end

  describe ".print_results" do
    it "prints the rankings of each team" do
      expect(new_board.print_results).to be_nil
    end
  end
end
