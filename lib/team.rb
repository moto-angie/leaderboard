class Team
  attr_reader :name
  attr_accessor :rank, :wins, :losses
  def initialize(team_name, rank = nil, wins = 0, losses = 0)
    @name = team_name
    @rank = rank
    @wins = wins
    @losses = losses
  end
end
