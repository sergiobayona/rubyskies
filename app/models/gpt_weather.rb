require 'openai'

class GptWeather
  def self.get_weather(record)
    response = client.chat(
      parameters: request_parameters(record)
    )
    JSON.parse(response['choices'][0]['message']['function_call']['arguments'])
  end

  def self.request_parameters(record) # rubocop:disable Metrics/MethodLength
    {
      model: 'gpt-3.5-turbo-1106',
      response_format: {
        type: 'json_object'
      },
      messages: [{
        role: 'system',
        content: system_message
      }, {
        role: 'user',
        content: message(record)
      }],
      function_call: { 'name': 'get_weather' },
      functions: [json_schema]
    }
  end

  # Generates the user prompt.
  def self.message(record)
    <<~HEREDOC
      Get the current weather with the following for the following location:
      city: #{record.city}
      state: #{record.state}
      state: #{record.postal_code}
    HEREDOC
  end

  def self.json_schema # rubocop:disable Metrics/MethodLength
    {
      name: 'get_weather',
      description: 'Get the current weather for a location',
      parameters: {
        type: 'object',
        required: %w[city state postal_code current_temperature temp_min temp_max],
        properties: {
          city: {
            title: 'City',
            decription: 'The city for which you want the weather',
            type: 'string'
          },
          state: {
            title: 'State',
            decription: 'The state for which you want the weather',
            type: 'string'
          },
          postal_code: {
            title: 'Postal Code',
            decription: 'The postal code for which you want the weather'
          },
          current_temperature: {
            title: 'Current Temperature',
            decription: 'The current temperature in fahrenheit',
            type: 'number'
          },
          temp_min: {
            title: 'Minimum Temperature',
            decription: 'The minimum temperature in fahrenheit',
            type: 'number'
          },
          temp_max: {
            title: 'Maximum Temperature',
            decription: 'The maximum temperature in fahrenheit',
            type: 'number'
          }
        }
      }
    }
  end

  def self.system_message
    'You are a helpful weather bot. You can tell the current weather conditions for any location. Your answers are always in JSON format. All temperatures in fahrenheit.'
  end

  def self.client
    OpenAI::Client.new(access_token: Rails.application.credentials[:openai_api_key]) do |f|
      f.response :logger, Logger.new($stdout), bodies: true
    end
  end
end
