function create(c::Client, ::Type{Invite}, ch::DiscordChannel; kwargs...)
    return create_channel_invite(c, ch.id; kwargs...)
end

retrieve(c::Client, ::Type{Invite}, g::AbstractGuild) = get_guild_invites(c, g.id)
retrieve(c::Client, ::Type{Invite}, ch::DiscordChannel) = get_channel_invites(c, ch.id)
function retrieve(c::Client, ::Type{Invite}, invite::AbstractString; kwargs...)
    return get_invite(c, invite; kwargs...)
end

delete(c::Client, i::Invite) = delete_invite(c, i.code)
