require "openai"

pp "howdy"

client = OpenAI::Client.new(access_token: ENV.fetch("OPENAI_API_KEY"))

list_of_messages = [
  { :role => "system", :content => "You are a helpful assistant."},
  { :role => "user", :content => "What are the best pizza spots in Chicago?"}
]

raw_response = client.chat(
  parameters: {
    model: "gpt-3.5-turbo",
    messages: list_of_messages
  }
)

pp raw_response

next_message = raw_response.fetch.("choices").at(0).fetch("message")

list_of_messages.push(next_message)

pp next_message
