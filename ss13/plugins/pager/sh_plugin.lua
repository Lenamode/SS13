PLUGIN.name = "Pager"
PLUGIN.author = "Sixx"
PLUGIN.desc = "Adds usable pagers for in-game communication."

nut.command.Register({
	allowDead = false,
	syntax = "<string name> <string message>",
	onRun = function(client, arguments)
		local target = nut.command.FindPlayer(client, arguments[1])

		if (target) then
			table.remove(arguments, 1)
			local text = table.concat(arguments, " ")

			if (!text or #text < 1) then
				nut.util.Notify(nut.lang.Get("missing_arg", 2), client)

				return
			end

			local voiceMail = target.character:GetData("voicemail")

			if (voiceMail) then
				nut.chat.Send(client, "pager", target:Name()..": "..voiceMail)

				return
			end
			
			local message = client:Name()..": "..text

			nut.chat.Send(client, "pager", message)
			nut.chat.Send(target, "You have been paged:", message)
		end
	end
}, "pager")

nut.command.Register({
	allowDead = true,
	syntax = "[string message]",
	onRun = function(client, arguments)
		local message = table.concat(arguments, " ")
		local delete = false

		if (!string.find(message, "%S")) then
			client.character:SetData("voicemail", nil)
			nut.util.Notify("You have deleted your voicemail.", client)
		else
			client.character:SetData("voicemail", message)
			nut.util.Notify("You have changed your voicemail.", client)
		end
	end
}, "setvoicemail")

