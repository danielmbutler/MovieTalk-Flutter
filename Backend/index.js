 // api and dynamodb setup
 var req = require('request');
 var AWS = require('aws-sdk');
 AWS.config.update({region: 'us-east-1'});
 var dynamodb = new AWS.DynamoDB();

    // api params
    const params = {
        url: 'api key',
        headers: { 'Content-Type': 'application/json' },
       
    };

    function insertToDB(item){
        dynamodb.putItem({TableName: 'MovieTalk', Item: item}, function(err, data){
            if (err) {
            console.log(err); // an error occurred
            } else {
            // successful response
            console.log("inserted");
            }
        });
    }

    req.post(params, function(err, res, body) {
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
                const movie = {
                    "Title" : {"S" : movieList[i].original_title},
                    "rating" : {"N" : String(movieList[i].vote_average)},
                    "img": {"S" : movieList[i].poster_path},
                    "overview": {"S" : movieList[i].overview}
                };
                insertToDB(movie);
            }; 
        }
    });
