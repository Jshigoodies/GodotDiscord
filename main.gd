extends Control

var token = "MTA2Njk0NjIwMjk4NzQxNzYwMQ.GgZFHG.w9ndfKykb-2HhGX3_eygQ2laPe7E9avdqFWFaY"
# Not my real token. I always change it either way so.....

var global_bot = null
var global_message = null

func _ready():
	var discord_bot = $DiscordBot
	
	discord_bot.TOKEN = token
	discord_bot.login()

	discord_bot.connect("bot_ready", self, "_on_bot_ready")
	discord_bot.connect("message_create", self, "_on_message_create")

func _on_bot_ready(bot: DiscordBot):
	print("bot is ready")
	global_bot = bot
	bot.set_presence({
		"status": "online",
		"acitivty": {
			"type": "GAME",
			"name": "Godot Bot"
		}
	})

func _on_message_create(bot: DiscordBot, message: Message, channel: Dictionary):
	print("got a message: ", message.content)
	if message.content == "!init":
		global_message = message
	if message.content == "fk you":
		bot.send(message, "shut the fk up")
		bot.delete(message)


func _on_Button_button_down():
	if global_message == null:
		return
	global_bot.send(global_message, "Pressed button F to pay respects")


func _on_send_button_button_down():
	if global_message == null:
		return
	global_bot.send(global_message, $TextEdit.text)
	$TextEdit.text = ""
