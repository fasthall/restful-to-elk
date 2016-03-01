# restful-to-elk
Quick deploying ELK stack and pull data from RESTful API

Usage
```
docker run -d -p 5601:5601 -p 9200:9200 -e URL=$RESTFUL_URL fasthall/restful-to-elk
```