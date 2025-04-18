# Write your solution here!
require "openai"
require "dotenv/load"

client = OpenAI::Client.new(access_token: ENV.fetch("OPENAI_KEY"), log_errors: true)

# Prepare an Array of previous messages
message_list = [
  {
    "role" => "system",
    "content" => "You are a helpful assistant who talks like Shakespeare."
  },
  {
    "role" => "user",
    "content" => "Hello! What are the best spots for pizza in Chicago?"
  }
]

# Call the API to get the next message from GPT
response = client.chat(
  parameters: {
    model: "gpt-4o", # Required.
    messages: [{ role: "user", content: "Hello!"}], # Required.
    temperature: 0.7,
  }
)
puts response.dig("choices", 0, "message", "content")
# => "Hello! How may I assist you today?"
