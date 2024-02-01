# README

An app to check the weather in a given location. 
The location form is powered by the Google places API. It auto-completes the location as the user types.
The app also uses OpenAI's gpt-3.5-turbo-1106 model via their API. The AI model is used to generate a summary of the weather in the given location.

It uses Tailwind CSS for styling, Hotwire/Stimulus for JS, SQLite for the database and RSpec for testing.

## AI Functionality
The app uses the OpenAI API to generate a summary of the weather in the given location. The app makes a special POST request to the OpenAI API with the weather data as the prompt. The API then returns a summary of the weather in the given location. The app then displays the summary to the user.
It uses a new prompting technique called "Structured Extraction" that has been enabled by the OpenAI API function calling capabilities. See https://platform.openai.com/docs/guides/function-calling


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