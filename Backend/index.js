 // api and dynamodb setup
 var req = require('request');
 require('isomorphic-fetch');



    // api params
    const movieApiParams = {
        url: 'https://api.themoviedb.org/3/movie/popular?api_key=6ae9a511f0dda8249130d7693f1539d4&language=en-US&page=1',
        headers: { 'Content-Type': 'application/json' },
       
    };
    

    req.post(movieApiParams, function(err, res, body) {
        if(err){
            console.log('------error------', err);
        } else{
            // parse response body as json
            const result = JSON.parse(body);
           
            // set movieList variable
            const movieList = result.results;
           
            // define movies array
            const moviesToBeInserted = [];
            
            // loop through movieList and create movie obj
            // add obj to movieList to insert into dynamodb

            for (var i = 0; i < movieList.length; i++) {
                var requestBody =  JSON.stringify({ query: `
                mutation MyMutation {
                    createMovie(input: {img: "` + movieList[i].poster_path + `", latestMessage: "", latestMessageTime: "", overview: "` +movieList[i].overview +`", rating: "`+ String(movieList[i].vote_average) + `", title: "` + movieList[i].original_title + `"}) {
                    img
                    latestMessage
                    latestMessageTime
                    overview
                    rating
                    title
                    }
                }` 
                })
                console.log(requestBody)
                  fetch('https://2mi6df6yizegzkcjefy5jdhbim.appsync-api.eu-west-2.amazonaws.com/graphql', {
                        method: 'POST',
                        headers: { 'Content-Type': 'application/json', 'x-api-key' : 'da2-es2iwtuezzewjmttq5y2aqay2y' },
                        body: requestBody,
                        })
                        .then(res => res.json())
                        .then(res => console.log(res));
            }; 
        }
    });
