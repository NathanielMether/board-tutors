AlgoliaSearch.configuration = {
  application_id: "F5B27GUW3C",
  api_key: ENV.fetch("ALGOLIA_KEY"),
  connect_timeout: 2,
  receive_timeout: 30,
  send_timeout: 30,
  batch_timeout: 120,
  search_timeout: 5
}