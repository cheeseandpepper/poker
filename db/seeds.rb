Dir["#{Rails.application.config.root}/lib/db_seeds/**"].each do |path|
  require path
end

#seed cards
DbSeeds::Cards.execute!

#seed players
DbSeeds::Players.execute!

#seed hand_references
DbSeeds::HandReferences.execute!
