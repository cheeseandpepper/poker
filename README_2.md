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
  - I containerized it