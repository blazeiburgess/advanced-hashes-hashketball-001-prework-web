# Write your code here!
def game_hash
	return {
		:home => {
			:team_name => "Brooklyn Nets",
			:colors => ['Black','White'],
			:players => {
				:alan_anderson => {
					:number => 0,
					:shoe => 16,
					:points => 22,
					:rebounds => 12,
					:assists => 12,
					:steals => 3,
					:blocks => 1,
					:slam_dunks => 1,
					:name => "Alan Anderson"
				},
				:reggie_evans => {
					:number => 30,
					:shoe => 14,
					:points => 12,
					:rebounds => 12,
					:assists => 12,
					:steals => 12,
					:blocks => 12,
					:slam_dunks => 7,
					:name => "Reggie Evans"
				},
				:brook_lopez => {
					:number => 11,
					:shoe => 17,
					:points => 17,
					:rebounds => 19,
					:assists => 10,
					:steals => 3,
					:blocks => 1,
					:slam_dunks => 15,
					:name => "Brook Lopez"
				},
				:mason_plumlee => {
					:number => 1,
					:shoe => 19,
					:points => 26,
					:rebounds => 12,
					:assists => 6,
					:steals => 3,
					:blocks => 8,
					:slam_dunks => 5,
					:name => "Mason Plumlee"
				},
				:jason_terry => {
					:number => 31,
					:shoe => 15,
					:points => 19,
					:rebounds => 2,
					:assists => 2,
					:steals => 4,
					:blocks => 11,
					:slam_dunks => 1,
					:name => "Jason Terry"
				}
			}

		},
		:away => {
			:team_name => "Charlotte Hornets",
			:colors => ["Turquoise","Purple"],
			:players => {
				:jeff_adrien => {
					:number => 4,
					:shoe => 18,
					:points => 10,
					:rebounds => 1,
					:assists => 1,
					:steals => 2,
					:blocks => 7,
					:slam_dunks => 2,
					:name => "Jeff Adrien"
				},
				:bismak_biyombo => {
					:number => 0,
					:shoe => 16,
					:points => 12,
					:rebounds => 4,
					:assists => 7,
					:steals => 7,
					:blocks => 15,
					:slam_dunks => 10,
					:name => "Bismak Biyombo"
				},
				:desagna_diop => {
					:number => 2,
					:shoe => 14,
					:points => 24,
					:rebounds => 12,
					:assists => 12,
					:steals => 4,
					:blocks => 5,
					:slam_dunks => 5,
					:name => "DeSagna Diop"
				},
				:ben_gordon => {
					:number => 8,
					:shoe => 15,
					:points => 33,
					:rebounds => 3,
					:assists => 2,
					:steals => 1,
					:blocks => 1,
					:slam_dunks => 0,
					:name => "Ben Gordon"
				},
				:brendan_haywood => {
					:number => 33,
					:shoe => 15,
					:points => 6,
					:rebounds => 12,
					:assists => 12,
					:steals => 22,
					:blocks => 5,
					:slam_dunks => 12,
					:name => "Brendan Haywood"
				}
			}
		}
	}
end

def num_points_scored(player_name)
	game_hash.each do |team,values|
		values[:players].each do |player, vals|
			if vals[:name] == player_name
				return vals[:points]
			end
		end
	end
end

def shoe_size(player_name)
	game_hash.each do |team,values|
		values[:players].each do |player, vals|
			if vals[:name] == player_name
				return vals[:shoe]
			end
		end
	end
end

def team_colors(team_name)
	game_hash.each do |loc,vals|
		if vals[:team_name] == team_name
			return vals[:colors]
		end
	end
end

def team_names
	return game_hash.collect {|l,v| v[:team_name]}
end

def player_numbers(team_name)
	game_hash.each do |l,v|
		if v[:team_name] == team_name
			return v[:players].collect {|p,v| v[:number]}		
		end
	end
end

class Hash
  def remove!(*keys)
    keys.each{|key| self.delete(key) }
    self
  end

  def remove(*keys)
    self.dup.remove!(*keys)
  end
end

def player_stats(player_name)
	game_hash.each do |team,values|
		values[:players].each do |player, vals|
			if vals[:name] == player_name
				tmp_vals = vals.remove(:name)
				return tmp_vals
			end
		end
	end
end

def big_shoe_rebounds
	shoe_size_store = 0
	player_rebounds = 0
	game_hash.each do |team,values|
		values[:players].each do |player, vals|
			if vals[:shoe] > shoe_size_store
				shoe_size_store = vals[:shoe]
				player_rebounds = vals[:rebounds]
			end
		end
	end
	return player_rebounds
end
