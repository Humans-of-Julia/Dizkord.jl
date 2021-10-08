function retrieve(c::Client, ::Type{User}, user::Integer)
    return if me(c) !== nothing && me(c).id == user
        get_current_user(c)
    else
        get_user(c, user)
    end
end
retrieve(c::Client, ::Type{User}) = get_current_user(c)

update(c::Client; kwargs...) = modify_current_user(c; kwargs...)
