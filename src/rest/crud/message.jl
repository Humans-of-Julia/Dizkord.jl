function create(c::Client, ::Type{Message}, ch::DiscordChannel; kwargs...)
    return create_message(c, ch.id; compkwfix(; kwargs...)...)
end

function retrieve(c::Client, ::Type{Message}, ch::DiscordChannel, message::Integer)
    return get_channel_message(c, ch.id, message)
end
function retrieve(
    c::Client,
    ::Type{Message},
    ch::DiscordChannel;
    pinned::Bool=false,
    kwargs...,
)
    return if pinned
        get_pinned_messages(c, ch.id)
    else
        get_channel_messages(c, ch.id; kwargs...)
    end
end

update(c::Client, m::Message; kwargs...) = edit_message(c, m.channel_id, m.id; kwargs...)

function delete(c::Client, m::Message; pinned::Bool=false)
    return if pinned
        delete_pinned_channel_message(c, m.channel_id, m.id)
    else
        delete_message(c, m.channel_id, m.id)
    end
end
function delete(c::Client, ms::Vector{Message})
    return bulk_delete_messages(c, ms[1].channel_id; messages=map(m -> m.id, ms))
end
