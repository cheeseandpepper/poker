# Poker Thing

## Research

Some known requirements
  - input is a provided list of 2 player poker games, cards represented as 2 character strings
  - deliverable is a list of each game, showing the cards for each player, the name of the hand, and the winner of each game. Additionally show the number of wins per player. Include tests

Some thoughts
  - will need to convert a raw hand string to a hand name
  - will need to be able to rank/compare hands


## Comparing approaches

  - "What is this hand" - leans into code to assess each hand based on rules and find a match. Could be case statements in hand rank order (am I a royal flush? no. am i a straight flush. no etc) Heuristics could be tough. 
  - Compare hand to known hand in db. This would be precomputing all hands and doing lookups. Would need lots of rows in db, (2.6 million possible hands, 311 million total permutations) Would either need source data or would have to algorithmically generate all hands. Yuck. Still would need to name hands which requires analysis. Look for existing resources/data sets available to help.
  - Precompute hands by name. This might be easier to code. Would need 1 algorithm per hand type. 
  - Hybrid approach? separate card ranks from suits. Can we determine a winner just by looking at one or the other? Would be more efficient in most cases, but not sure how accurate it would be. I foresee edge cases.


## Where I think I'll land

  - Research led me to a handy table like data set which included the name of the hand, sorted in rank from highest to lowest rank, and the 5 cards that make up that hand. Does not mention suit, but given that this source data exists with hand name and rank, it seems like a great place to start.

  http://web.archive.org/web/20140718120216/http://www.suffecool.net/poker/7462.html


  - From here, I can seed a db that will serve as a hand name lookup and because its sorted, I'll know which hand ranks higher. Because suits are not reflected here, I think I can enhance this data set with the idea of "does the suit matter for this hand, y/n" - When parsing hands I can separate the ranks from the suits and compare ranks with the data set, then also check if suit matters and do further comparison if need be. For each hand name, the "does the suit matter" will be either true or false. This also takes care of ties for me, since the sorting includes the extra cards not part of the hand name.

  - Thinking aloud, one case is how to analyze a straight vs a straight flush. This data set will have 2 entries for 2, 3, 4, 5, 6. If when moving the data set to a db, I add a boolean for the suit is important field, I can probably add to the query whether or not the hand is of the same suit. Then it should return only 1 result.

  - So I think I have a clear path forward, but let's see where it goes!