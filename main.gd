extends Control

var token = "MTA2Njk0NjIwMjk4NzQxNzYwMQ.GqOlPG.6NJTqu5IfRxQjBWi3IlEdfnsg1AqdsDOXjARTg"

func _ready():
	var discord_bot = $DiscordBot
	
	discord_bot.TOKEN = token
	discord_bot.login()

	discord_bot.connect("bot_ready", self, "_on_bot_ready")
	discord_bot.connect("message_create", self, "_on_message_create")

func _on_bot_ready(bot: DiscordBot):
	print("bot is ready")
	
	bot.set_presence({
		"acitivty": {
			"type": "GAME",
			"name": "Godot Bot"
		}
	})

func _on_message_create(bot: DiscordBot, message: Message, channel: Dictionary):
	print("got a message: ", message.content)
	if message.content == "fk you":
		bot.send(message, "shut the fk up")
