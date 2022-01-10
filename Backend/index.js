 // api and dynamodb setup
 var req = require('request');
 require('isomorphic-fetch');



    // api params
    const movieApiParams = {
        url: 'apikey',
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
                    createMovieModel(input: {img: "` + movieList[i].poster_path + `", latestMessage: "", latestMessageTime: "", overview: "` +movieList[i].overview +`", rating: "`+ String(movieList[i].vote_average) + `", title: "` + movieList[i].original_title + `"}) {
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
                  fetch('', {
                        method: 'POST',
                        headers: { 'Content-Type': 'application/json', 'x-api-key' : '' },
                        body: requestBody,
                        })
                        .then(res => res.json())
                        .then(res => console.log(res));
            }; 
        }
    });
