retrieve(c::Client, ::Type{GuildEmbed}, g::AbstractGuild) = get_guild_embed(c, g.id)

function update(c::Client, ::GuildEmbed, g::AbstractGuild; kwargs...)
    return modify_guild_embed(c, g.id; kwargs...)
end
