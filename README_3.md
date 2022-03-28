# Postmortem

## The plan

It worked pretty well. With the data source I was able to
  - extract an available resource from the web
  - make my own csv
  - Build out a series of Ingestors
  - Ingest the csv and save a sorted data set of HandReferences
  - Seed Players/Cards
  - Ingest the supplied data set of 1000 games
  - Use the Divider class to split the hands from a 2 hand string
  - Use the Sorter class to sort and produce important facets
  - Use the Winner class to evaluate 2 organized hands, extract a sorted key,
    query hand references for same key and get rank, compare ranks, then save
    game and hand data to the db
  - It started off as taking 2.5 minutes for the whole ingestion, but then I got it
    down to about 20 seconds. 
  - I found some css for card hands and built out basic index views to show the data.
  - I built a very cheap pagination
  - I containerized it.


## Things I would want to do but didn't (because this could go on forever)
  - More testing, factorybot.
  - Move much of the code in the db_seeds dir into service classes under ./services/ 
  - Deal with the "2 players dependency" - source data assumed 2 players and that became something I had to carry across the whole code. It would be nice to abstract that somehow, and not have speficic player_1_method, player_2_method.  etc. I started down this path and in the interest of time I kept it going. But it's the biggest problem with this code IMO.
  - Make things DRYer (related to the previous point)
  - Do something other than basic html/css.  
  - Use turbo-streams (new to rails 7!) to build out live search. This db is ready to be searched.
  - Implement elasticsearch for even better searching. A bg process could generate all 311 million hand combos, put them in ES, and in a distributed system, get near O(1) performance for hand looups. Hand autocomplete would be a cool feature, esp for any hand, any deal order.
  - Schema is... a bit obtuse. I kinda threw everything at it at first, not fully knowing where I'd land. But it would benefit from a 2nd pass now that it has been built.
  - card_id on hands was an idea I had about sorting. Rather than use the raw hand string and parse and make my custom sorting, I could potentially use the card_id to assist with sorting. But I didnt get there.
  - Bring ingestion to the UI. Perhaps an admin screen to re-import? More of a dev convenience.
  - Tune db, some indexes were added, but I suspect there's room for improvement.

  Thank you for the project. It was fun. I got to figure out a solution that worked for me. I got to play with rails 7 for the first time, and deployed to heroku for the first time in a while. 
