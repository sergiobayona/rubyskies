# README

An app to check the weather in a given location. 
The location form is powered by the Google places API. It auto-completes the location as the user types.
The app also uses OpenAI's gpt-3.5-turbo-1106 model via their API.
It makes a function call that returns the weather values in json. The app then parses the json and displays the weather in a user-friendly format.

This README would normally document whatever steps are necessary to get the
application up and running.

It uses Tailwind CSS for styling, SQLite for the database and RSpec for testing.

## Configuration
The app uses Rails credentials to store the API keys.
I have included the encrypted credentials file in the repo and will provide the key in email to brharvey email.
You can use my api keys for testing purposes, but I recommend setting up your own keys.
Setting up the Google places api key is somewhat involved becauses you have to assign the proper permissions to the api key.
To update the credentials, run the following command:

```bash
EDITOR="nano" rails credentials:edit
```
Then add the following keys:
```yaml
google_maps_api_key: <your_google_places_api_key>
openai_api_key: <your_openai_api_key>
```


## Quick Start

Install the dependencies:
```bash
bundle install
```

Create the database:
```bash
rails db:setup
```

Start the server:

```bash
foreman start -f Procfile.dev
```

Then visit http://127.0.0.1:5000/

## Ruby version
3.3.0