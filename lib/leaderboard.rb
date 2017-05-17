require_relative "team.rb"

class Leaderboard
GAME_INFO = [
    {
      home_team: "Patriots",
      away_team: "Broncos",
      home_score: 17,
      away_score: 13
    },
    {
      home_team: "Broncos",
      away_team: "Colts",
      home_score: 24,
      away_score: 7
    },
    {
      home_team: "Patriots",
      away_team: "Colts",
      home_score: 21,
      away_score: 17
    },
    {
      home_team: "Broncos",
      away_team: "Steelers",
      home_score: 11,
      away_score: 27
    },
    {
      home_team: "Steelers",
      away_team: "Patriots",
      home_score: 24,
      away_score: 31
    }
]

attr_reader :teams

def initialize
  @teams = []
  GAME_INFO.each do |game|
    @teams << game[:home_team]
    @teams << game[:away_team]
  end
  @teams = @teams.uniq
  create_team_objects
  wins_losses
  rank
end

def create_team_objects
  @teams = @teams.map { |team| Team.new(team) }
end

def wins_losses
  GAME_INFO.each do |game|
    home_team = @teams.find { |team| team.name == game[:home_team] }
    away_team = @teams.find { |team| team.name == game[:away_team] }
    if game[:home_score] > game[:away_score]
      home_team.wins += 1
      away_team.losses += 1
    else
      home_team.losses += 1
      away_team.wins += 1
    end
  end
end

def rank
  ranks = []
  @teams.each do |team|
    team_score = team.wins - team.losses
    team.rank = team_score
  end

  @teams = (@teams.sort_by { |team| team.rank }).reverse

  @teams.each_with_index do |team, index|
    team.rank = index + 1
  end
end

def print_results
    leaderboard_results =  "--------------------------------------------------\n| Name      Rank      Total Wins    Total Losses |\n"

  @teams.each do |team|
        leaderboard_results += "| #{team.name}     #{team.rank}            #{ team.wins}             #{team.losses}       |\n"
  end

  leaderboard_results += "\n--------------------------------------------------"
  puts leaderboard_results
end
end
require 'pry'
# binding.pry
