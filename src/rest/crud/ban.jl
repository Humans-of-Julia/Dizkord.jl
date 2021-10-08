function create(c::Client, ::Type{Ban}, g::AbstractGuild, u::User; kwargs...)
    return create_guild_ban(c, g.id, u.id; kwargs...)
end

function retrieve(c::Client, ::Type{Ban}, g::AbstractGuild, u::User)
    return get_guild_ban(c, g.id, u.id)
end
retrieve(c::Client, ::Type{Ban}, g::AbstractGuild) = get_guild_bans(c, g.id)

function delete(c::Client, b::Ban, g::AbstractGuild)
    return remove_guild_ban(c, g.id, b.user.id)
end
