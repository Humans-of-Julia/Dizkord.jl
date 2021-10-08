export Presence

const PRESENCE_STATUSES = ["idle", "dnd", "online", "offline"]

"""
A [`User`](@ref)'s status sent in a [`Presence`](@ref). Available values are `PS_IDLE`,
`PS_DND`, `PS_ONLINE`, and `PS_OFFLINE`.
More details [here](https://discordapp.com/developers/docs/resources/channel#message-object-message-application-structure).
"""
@enum PresenceStatus PS_IDLE PS_DND PS_ONLINE PS_OFFLINE PS_UNKNOWN
@boilerplate PresenceStatus :export

function PresenceStatus(x::AbstractString)
    i = findfirst(isequal(x), PRESENCE_STATUSES)
    return i === nothing ? PS_UNKNOWN : PresenceStatus(i - 1)
end

Base.string(x::PresenceStatus) = x === PS_UNKNOWN ? "" : PRESENCE_STATUSES[Int(x) + 1]
JSON.lower(x::PresenceStatus) = string(x)

"""
A [`User`](@ref)'s presence.
More details [here](https://discordapp.com/developers/docs/topics/gateway#presence-update).
"""
struct Presence
    user::User
    roles::Optional{Vector{Snowflake}}
    game::Nullable{Activity}
    guild_id::Optional{Snowflake}
    status::PresenceStatus
    activities::Vector{Activity}
end
@boilerplate Presence :constructors :docs :lower :merge :mock
