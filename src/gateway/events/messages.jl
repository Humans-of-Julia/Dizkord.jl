export MessageCreate,
    MessageUpdate,
    MessageDelete,
    MessageDeleteBulk,
    MessageReactionAdd,
    MessageReactionRemove,
    MessageReactionRemoveAll

"""
Sent when a [`Message`](@ref) is sent.
"""
struct MessageCreate <: AbstractEvent
    message::Message
end
@boilerplate MessageCreate :docs :mock
MessageCreate(; kwargs...) = MessageCreate(Message(; kwargs...))
MessageCreate(d::Dict{Symbol, Any}) = MessageCreate(; d...)


"""
Sent when a [`Message`](@ref) is updated.
"""
struct MessageUpdate <: AbstractEvent
    message::Message
end
@boilerplate MessageUpdate :docs :mock
MessageUpdate(; kwargs...) = MessageUpdate(Message(; kwargs...))
MessageUpdate(d::Dict{Symbol, Any}) = MessageUpdate(; d...)

"""
Sent when a [`Message`](@ref) is deleted.
"""
struct MessageDelete <: AbstractEvent
    id::Snowflake
    channel_id::Snowflake
    guild_id::Optional{Snowflake}
end
@boilerplate MessageDelete :constructors :docs :mock

"""
Sent when multiple [`Message`](@ref)s are deleted in bulk.
"""
struct MessageDeleteBulk <: AbstractEvent
    ids::Vector{Snowflake}
    channel_id::Snowflake
    guild_id::Optional{Snowflake}
end
@boilerplate MessageDeleteBulk :constructors :docs :mock

"""
Sent when a [`Reaction`](@ref) is added to a [`Message`](@ref).
"""
struct MessageReactionAdd <: AbstractEvent
    user_id::Snowflake
    channel_id::Snowflake
    message_id::Snowflake
    guild_id::Optional{Snowflake}
    emoji::Emoji
end
@boilerplate MessageReactionAdd :constructors :docs :mock

"""
Sent when a [`Reaction`](@ref) is removed from a [`Message`](@ref).
"""
struct MessageReactionRemove <: AbstractEvent
    user_id::Snowflake
    channel_id::Snowflake
    message_id::Snowflake
    guild_id::Optional{Snowflake}
    emoji::Emoji
end
@boilerplate MessageReactionRemove :constructors :docs :mock

"""
Sent when all [`Reaction`](@ref)s are removed from a [`Message`](@ref).
"""
struct MessageReactionRemoveAll <: AbstractEvent
    channel_id::Snowflake
    message_id::Snowflake
    guild_id::Optional{Snowflake}
end
@boilerplate MessageReactionRemoveAll :constructors :docs :mock

