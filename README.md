# safeboda-ios-code-challenge-achemsamuel

This app displays searched cards from Magic: The Gathering Trading Card Game (TCG).

Users can see an quick overview of few details of their favorite trading card games on the search results screen.
The CardDetail scene gives a clearer view of the games with more detail ranging from legalitites to cmc, oracle, set name, release data, type e.t.c.
A known issue in the app is the inability of the api used to return a selected number of objects, thus, a slightly noticeable delay in fetching data from the backend. 
A better approach to solving this would be to implement a 'pageSize' parameter alongside pagination which is already implemented with the endpoint.
