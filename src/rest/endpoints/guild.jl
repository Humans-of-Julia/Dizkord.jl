export create_guild,
    get_guild,
    modify_guild,
    delete_guild,
    get_guild_channels,
    create_guild_channel,
    modify_guild_channel_positions,
    get_guild_member,
    list_guild_members,
    add_guild_member,
    modify_guild_member,
    modify_current_user_nick,
    add_guild_member_role,
    remove_guild_member_role,
    remove_guild_member,
    get_guild_bans,
    get_guild_ban,
    create_guild_ban,
    remove_guild_ban,
    get_guild_roles,
    create_guild_role,
    modify_guild_role_positions,
    modify_guild_role,
    delete_guild_role,
    get_guild_prune_count,
    begin_guild_prune,
    get_guild_voice_regions,
    get_guild_invites,
    get_guild_integrations,
    create_guild_integration,
    modify_guild_integration,
    delete_guild_integration,
    sync_guild_integration,
    get_guild_embed,
    modify_guild_embed,
    get_vanity_url,
    get_guild_widget_image

"""
    create_guild_scheduled_event(c::Client, guild::Integer; kwargs...)

Create a Guild Scheduled Event.
More details [here](https://discord.com/developers/docs/resources/guild-scheduled-event#create-guild-scheduled-event)
"""
function create_guild_scheduled_event(c::Client, guild::Integer, s::ScheduledEvent; kwargs...)
    return Response{ScheduledEvent}(c, :POST, "/guilds/$(guild)/scheduled-events"; body=s)
end

"""
    modify_guild_scheduled_event(c::Client, guild::Integer; kwargs...)

Modify a Guild Scheduled Event.
More details [here](https://discord.com/developers/docs/resources/guild-scheduled-event#modify-guild-scheduled-event)
"""
function modify_guild_scheduled_event(c::Client, guild::Integer, s::ScheduledEvent; kwargs...)
    return Response{ScheduledEvent}(c, :PATCH, "/guilds/$(guild)/scheduled-events/$(s.id)"; body=s)
end

"""
    delete_guild_scheduled_event(c::Client, guild::Integer; kwargs...)

Delete a Guild Scheduled Event.
More details [here](https://discord.com/developers/docs/resources/guild-scheduled-event#delete-guild-scheduled-event)
"""
function delete_guild_scheduled_event(c::Client, guild::Integer, s::ScheduledEvent)
    return Response(c, :DELETE, "/guilds/$(guild)/scheduled-events/$(s.id)")
end


"""
    get_guild_scheduled_event(c::Client, guild::Integer; kwargs...)

Get a Guild Scheduled Event.
More details [here](https://discord.com/developers/docs/resources/guild-scheduled-event#get-guild-scheduled-event)
"""
function get_guild_scheduled_event(c::Client, guild::Integer, s::Integer; kwargs...)
    return Response{ScheduledEvent}(c, :GET, "/guilds/$(guild)/scheduled-events/$(s.id)", body=kwargs)
end

"""
    create_guild(c::Client; kwargs...) -> Guild

Create a [`Guild`](@ref).
More details [here](https://discordapp.com/developers/docs/resources/guild#create-guild).
"""
function create_guild(c::Client; kwargs...)
    return Response{Guild}(c, :POST, "/guilds"; body=kwargs)
end

"""
    get_guild(c::Client, guild::Integer) -> Guild

Get a [`Guild`](@ref).
"""
function get_guild(c::Client, guild::Integer)
    return Response{Guild}(c, :GET, "/guilds/$guild")
end

"""
    modify_guild(c::Client, guild::Integer; kwargs...) -> Guild

Edit a [`Guild`](@ref).
More details [here](https://discordapp.com/developers/docs/resources/guild#modify-guild).
"""
function modify_guild(c::Client, guild::Integer; kwargs...)
    return Response{Guild}(c, :PATCH, "/guilds/$guild"; body=kwargs)
end

"""
    delete_guild(c::Client, guild::Integer)

Delete a [`Guild`](@ref).
"""
function delete_guild(c::Client, guild::Integer)
    return Response(c, :DELETE, "/guilds/$guild")
end

"""
    get_guild_channels(c::Client, guild::Integer) -> Vector{DiscordChannel}

Get the [`DiscordChannel`](@ref)s in a [`Guild`](@ref).
"""
function get_guild_channels(c::Client, guild::Integer)
    return Response{Vector{DiscordChannel}}(c, :GET, "/guilds/$guild/channels")
end

"""
    create_guild_channel(c::Client, guild::Integer; kwargs...) -> DiscordChannel

Create a [`DiscordChannel`](@ref) in a [`Guild`](@ref).
More details [here](https://discordapp.com/developers/docs/resources/guild#create-guild-channel).
"""
function create_guild_channel(c::Client, guild::Integer; kwargs...)
    return Response{DiscordChannel}(c, :POST, "/guilds/$guild/channels"; body=kwargs)
end

"""
    modify_guild_channel_positions(c::Client, guild::Integer, positions...)

Modify the positions of [`DiscordChannel`](@ref)s in a [`Guild`](@ref).
More details [here](https://discordapp.com/developers/docs/resources/guild#modify-guild-channel-positions).
"""
function modify_guild_channel_positions(c::Client, guild::Integer, positions...)
    return Response(c, :PATCH, "/guilds/$guild/channels"; body=positions)
end

"""
    get_guild_member(c::Client, guild::Integer, user::Integer) -> Member

Get a [`Member`](@ref) in a [`Guild`](@ref).
"""
function get_guild_member(c::Client, guild::Integer, user::Integer)
    return Response{Member}(c, :GET, "/guilds/$guild/members/$user")
end

"""
    list_guild_members(c::Client, guild::Integer; kwargs...) -> Vector{Member}

Get a list of [`Member`](@ref)s in a [`Guild`](@ref).
More details [here](https://discordapp.com/developers/docs/resources/guild#list-guild-members).
"""
function list_guild_members(c::Client, guild::Integer; kwargs...)
    return Response{Vector{Member}}(c, :GET, "/guilds/$guild/members"; kwargs...)
end

"""
    add_guild_member(c::Client; kwargs...) -> Member

Add a [`User`](@ref) to a [`Guild`](@ref).
More details [here](https://discordapp.com/developers/docs/resources/guild#add-guild-member).
"""
function add_guild_member(c::Client, guild::Integer, user::Integer; kwargs...)
    return Response{Member}(c, :PUT, "/guilds/$guild/members/$user"; body=kwargs)
end

"""
    modify_guild__member(c::Client, guild::Integer, user::Integer; kwargs...)

Modify a [`Member`](@ref) in a [`Guild`](@ref).
More details [here](https://discordapp.com/developers/docs/resources/guild#modify-guild-member).
"""
function modify_guild_member(c::Client, guild::Integer, user::Integer; kwargs...)
    return Response(c, :PATCH, "/guilds/$guild/members/$user"; body=kwargs)
end

"""
    modify_current_user_nick(c::Client, guild::Intger; kwargs...) -> String

Modify the [`Client`](@ref) user's nickname in a [`Guild`](@ref).
More details [here](https://discordapp.com/developers/docs/resources/guild#modify-current-user-nick).
"""
function modify_current_user_nick(c::Client, guild::Integer; kwargs...)
    return Response{String}(c, :PATCH, "/guilds/$guild/members/@me/nick"; body=kwargs)
end

"""
    add_guild_member_role(c::Client, guild::Integer, user::Integer, role::Integer)

Add a [`Role`](@ref) to a [`Member`](@ref).
"""
function add_guild_member_role(c::Client, guild::Integer, user::Integer, role::Integer)
    return Response(c, :PUT, "/guilds/$guild/members/$user/roles/$role")
end

"""
    remove_guild_member_role(c::Client, guild::Integer, user::Integer, role::Integer)

Remove a [`Role`](@ref) from a [`Member`](@ref).
"""
function remove_guild_member_role(c::Client, guild::Integer, user::Integer, role::Integer)
    return Response(c, :DELETE, "/guilds/$guild/members/$user/roles/$role")
end

"""
    remove_guild_member(c::Client, guild::Integer, user::Integer)

Kick a [`Member`](@ref) from a [`Guild`](@ref).
"""
function remove_guild_member(c::Client, guild::Integer, user::Integer)
    return Response(c, :DELETE, "/guilds/$guild/members/$user")
end

"""
    get_guild_bans(c::Client, guild::Integer) -> Vector{Ban}

Get a list of [`Ban`](@ref)s in a [`Guild`](@ref).
"""
function get_guild_bans(c::Client, guild::Integer)
    return Response{Vector{Ban}}(c, :GET, "/guilds/$guild/bans")
end

"""
    get_ban(c::Client, guild::Integer,  user::Integer) -> Ban

Get a [`Ban`](@ref) in a [`Guild`](@ref).
"""
function get_guild_ban(c::Client, guild::Integer, user::Integer)
    return Response{Ban}(c, :GET, "/guilds/$guild/bans/$user")
end

"""
    create_guild_ban(c::Client, guild::Integer, user::Integer; kwargs...)

Ban a [`Member`](@ref) from a [`Guild`](@ref).
More details [here](https://discordapp.com/developers/docs/resources/guild#create-guild-ban).
"""
function create_guild_ban(c::Client, guild::Integer, user::Integer; kwargs...)
    return Response(c, :PUT, "/guilds/$guild/bans/$user"; kwargs...)
end

"""
    remove_guild_ban(c::Client, guild::Integer, user::Integer)

Unban a [`User`](@ref) from a [`Guild`](@ref).
"""
function remove_guild_ban(c::Client, guild::Integer, user::Integer)
    return Response(c, :DELETE, "/guilds/$guild/bans/$user")
end

"""
    get_guild_roles(c::Client, guild::Integer) -> Vector{Role}

Get a [`Guild`](@ref)'s [`Role`](@ref)s.
"""
function get_guild_roles(c::Client, guild::Integer)
    return Response{Vector{Role}}(c, :GET, "/guilds/$guild/roles")
end

"""
    create_guild_role(c::Client, guild::Integer; kwargs) -> Role

Create a [`Role`](@ref) in a [`Guild`](@ref).
More details [here](https://discordapp.com/developers/docs/resources/guild#create-guild-role).
"""
function create_guild_role(c::Client, guild::Integer; kwargs...)
    return Response{Role}(c, :POST, "/guilds/$guild/roles"; body=kwargs)
end

"""
    modify_guild_role_positions(c::Client, guild::Integer, positions...) -> Vector{Role}

Modify the positions of [`Role`](@ref)s in a [`Guild`](@ref).
More details [here](https://discordapp.com/developers/docs/resources/guild#modify-guild-role-positions).
"""
function modify_guild_role_positions(c::Client, guild::Integer, positions...)
    return Response{Vector{Role}}(c, :PATCH, "/guilds/$guild/roles"; body=positions)
end

"""
    modify_guild_role(c::Client, guild::Integer, role::Integer; kwargs) -> Role

Modify a [`Role`](@ref) in a [`Guild`](@ref).
More details [here](https://discordapp.com/developers/docs/resources/guild#modify-guild-role).
"""
function modify_guild_role(c::Client, guild::Integer, role::Integer; kwargs...)
    return Response{Role}(c, :PATCH, "/guilds/$guild/roles/$role"; body=kwargs)
end

"""
    delete_guild_role(c::Client, guild::Integer, role::Integer)

Delete a [`Role`](@ref) from a [`Guild`](@ref).
"""
function delete_guild_role(c::Client, guild::Integer, role::Integer)
    return Response(c, :DELETE, "/guilds/$guild/roles/$role")
end

"""
    get_guild_prune_count(c::Client, guild::Integer; kwargs...) -> Dict

Get the number of [`Member`](@ref)s that would be removed from a [`Guild`](@ref) in a prune.
More details [here](https://discordapp.com/developers/docs/resources/guild#get-guild-prune-count).
"""
function get_guild_prune_count(c::Client, guild::Integer; kwargs...)
    return Response{Dict}(c, :GET, "/guilds/$guild/prune"; kwargs...)
end

"""
    begin_guild_prune(c::Client, guild::Integer; kwargs...) -> Dict

Begin pruning [`Member`](@ref)s from a [`Guild`](@ref).
More details [here](https://discordapp.com/developers/docs/resources/guild#begin-guild-prune).
"""
function begin_guild_prune(c::Client, guild::Integer; kwargs...)
    return Response{Dict}(c, :POST, "/guilds/$guild/prune"; kwargs...)
end

"""
    get_guild_voice_regions(c::Client, guild::Integer) -> Vector{VoiceRegion}

Get a list of [`VoiceRegion`](@ref)s for the [`Guild`](@ref).
"""
function get_guild_voice_regions(c::Client, guild::Integer)
    return Response{Vector{VoiceRegion}}(c, :GET, "/guilds/$guild/regions")
end

"""
    get_guild_invites(c::Client, guild::Integer) -> Vector{Invite}

Get a list of [`Invite`](@ref)s to a [`Guild`](@ref).
"""
function get_guild_invites(c::Client, guild::Integer)
    return Response{Vector{Invite}}(c, :GET, "/guilds/$guild/invites")
end

"""
    get_guild_integrations(c::Client, guild::Integer) -> Vector{Integration}

Get a list of [`Integration`](@ref)s for a [`Guild`](@ref).
"""
function get_guild_integrations(c::Client, guild::Integer)
    return Response{Vector{Integration}}(c, :GET, "/guilds/$guild/integrations")
end

"""
    create_guild_integration(c::Client, guild::Integer; kwargs...)

Create/attach an [`Integration`](@ref) to a [`Guild`](@ref).
More details [here](https://discordapp.com/developers/docs/resources/guild#create-guild-integration).
"""
function create_guild_integration(c::Client, guild::Integer; kwargs...)
    return Response{Integration}(c, :POST, "/guilds/$guild/integrations"; body=kwargs)
end

"""
    modify_guild_integration(c::Client, guild::Integer, integration::Integer; kwargs...)

Modify an [`Integration`](@ref) in a [`Guild`](@ref).
More details [here](https://discordapp.com/developers/docs/resources/guild#modify-guild-integration).
"""
function modify_guild_integration(
    c::Client,
    guild::Integer,
    integration::Integer;
    kwargs...,
)
    return Response(c, :PATCH, "/guilds/$guild/integrations/$integration"; body=kwargs)
end

"""
    delete_guild_integration(c::Client, guild::Integer, integration::Integer)

Delete an [`Integration`](@ref) from a [`Guild`](@ref).
"""
function delete_guild_integration(c::Client, guild::Integer, integration::Integer)
    return Response(c, :DELETE, "/guilds/$guild/integrations/$integration")
end


"""
    sync_guild_integration(c::Client, guild::Integer, integration::Integer)

Sync an [`Integration`](@ref) in a [`Guild`](@ref).
"""
function sync_guild_integration(c::Client, guild::Integer, integration::Integer)
    return Response(c, :POST, "/guilds/$guild/integrations/$integration/sync")
end

"""
    get_guild_embed(c::Client, guild::Integer) -> GuildEmbed

Get a [`Guild`](@ref)'s [`GuildEmbed`](@ref).
"""
function get_guild_embed(c::Client, guild::Integer)
    return Response{GuildEmbed}(c, :GET, "/guilds/$guild/embed")
end

"""
    modify_guild_embed(c::Client, guild::Integer; kwargs...) -> GuildEmbed

Modify a [`Guild`](@ref)'s [`GuildEmbed`](@ref).
More details [here](https://discordapp.com/developers/docs/resources/guild#modify-guild-embed).
"""
function modify_guild_embed(c::Client, guild::Integer; kwargs...)
    return Response{GuildEmbed}(c, :PATCH, "/guilds/$guild/embed"; body=kwargs)
end

"""
    get_vanity_url(c::Client, guild::Integer) -> Invite

Get a [`Guild`](@ref)'s vanity URL, if it supports that feature.
"""
function get_vanity_url(c::Client, guild::Integer)
    return Response{Invite}(c, :GET, "/guilds/$guild/vanity-url")
end

"""
    get_guild_widget_image(c::Client, guild::Integer; kwargs...) -> Vector{UInt8}

Get a [`Guild`](@ref)'s widget image in PNG format.
More details [here](https://discordapp.com/developers/docs/resources/guild#get-guild-widget-image).
"""
function get_guild_widget_image(c::Client, guild::Integer; kwargs...)
    return Response{Vector{UInt8}}(c, :GET, "/guilds/$guild/widget.png"; kwargs...)
end
