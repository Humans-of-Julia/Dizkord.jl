using Dizkord

ENV["JULIA_DEBUG"] = Dizkord

client = Client(
    ENV["DISCORD_TOKEN"], 
    830208012668764250,
    intents(GUILDS, GUILD_MESSAGES)
)

on_message!(client) do (ctx) 
    println("Received message: $(ctx.message.content)")
    if ctx.message.author.id != 830208012668764250
        Dizkord.reply(client, ctx.message, content="<@$(ctx.message.author.id)>, $(ctx.message.content)")
    end
end

command!(client, retrieve(client, Dizkord.Guild, 776251117616234506)) do 
    println("Command ran!")
end

on_ready!(client) do (ctx)
    println("successfully logged in as $(ctx.user.username)")
end

start(client)
