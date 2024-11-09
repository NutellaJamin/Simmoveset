-- name: \\#ffff00\\{=-\\#ff0000\\Sim\\#ffffff\\Djam\\#ffff00\\-=} Moveset 
-- description: It's official...
-- incompatible: moveset


YBtBoost = 0
stopat = 0

m = gMarioStates[0]
-- Most Particles by @YTGolder
function before_phys_step()
    if m.controller.buttonDown & Y_BUTTON ~= 0 and m.action == ACT_WALKING or m.action == ACT_HOLD_WALKING and m.controller.buttonDown & Y_BUTTON ~= 0 then
       m.forwardVel = m.forwardVel + YBtBoost
       m.faceAngle.y = m.intendedYaw
       if YBtBoost > 19 then
        m.particleFlags = m.particleFlags | PARTICLE_SPARKLES
        m.particleFlags = m.particleFlags | PARTICLE_DUST
       else
        m.particleFlags = m.particleFlags | PARTICLE_DUST
       end
    end
    if m.action == ACT_BRAKING and m.controller.buttonDown & Y_BUTTON ~= 0 then
        m.forwardVel = 0
    end
    if m.action == ACT_FORWARD_ROLLOUT and m.controller.buttonPressed & X_BUTTON ~= 0 then
        set_mario_action(m, ACT_BACKFLIP, 0)
        m.forwardVel = 50
        stopat = 100
        m.particleFlags = m.particleFlags | PARTICLE_MIST_CIRCLE
    elseif m.action == ACT_FORWARD_ROLLOUT and m.controller.buttonPressed& Y_BUTTON ~= 0 then
        set_mario_action(m, ACT_JUMP_KICK, 0)
        m.particleFlags = m.particleFlags | ACTIVE_PARTICLE_UNUSED_1
        m.particleFlags = m.particleFlags | PARTICLE_DUST
    end
    if m.action == ACT_GROUND_POUND and m.controller.buttonPressed & A_BUTTON ~=0 then
        m.vel.y = 50
        m.forwardVel = 69
        m.faceAngle.y = m.intendedYaw
        m.particleFlags = m.particleFlags | PARTICLE_MIST_CIRCLE
        set_mario_action(m, ACT_SLIDE_KICK, 0)
        elseif m.action == ACT_GROUND_POUND and m.controller.buttonPressed & B_BUTTON ~=0 then
            set_mario_action(m, ACT_BACKWARD_ROLLOUT, 0)
            m.vel.y = 150
            m.forwardVel = 50
            m.faceAngle.y = m.intendedYaw
        elseif m.action == ACT_GROUND_POUND and m.controller.buttonDown & Y_BUTTON ~=0 then
            set_mario_action(m, ACT_TWIRLING, 0)
            m.particleFlags = m.particleFlags | PARTICLE_TRIANGLE
            m.particleFlags = m.particleFlags | PARTICLE_DUST
            m.vel.y = 50
            m.faceAngle.y = m.intendedYaw
        elseif m.action == ACT_TWIRLING and m.controller.buttonPressed & B_BUTTON ~=0 then
            set_mario_action(m, ACT_BACKWARD_ROLLOUT, 0)
            m.particleFlags = m.particleFlags | PARTICLE_MIST_CIRCLE
            m.vel.y = 60
            m.forwardVel = m.forwardVel + 10
            m.faceAngle.y = m.intendedYaw
    end
    if m.action == ACT_LONG_JUMP and m.controller.buttonDown & Y_BUTTON ~= 0 then
        set_mario_action(m, ACT_SPECIAL_TRIPLE_JUMP, 0)
        m.forwardVel = 79
        m.vel.y = 60
    elseif m.action == ACT_SPECIAL_TRIPLE_JUMP and m.controller.buttonDown & X_BUTTON ~= 0 then
        m.vel.y = 50
        set_mario_action(m, ACT_TWIRLING, 0)
        m.forwardVel = m.forwardVel + 15
    elseif m.action == ACT_TWIRLING then
        if stopat < 21 and m.forwardVel > 40 then
        stopat = stopat + 1
        m.particleFlags = m.particleFlags | PARTICLE_SPARKLES
        end
    end
    if stopat == 20 then
        set_mario_action(m, ACT_FREEFALL, 0)
        stopat = 0
    end
    if m.controller.buttonPressed & X_BUTTON ~= 0 and m.action == ACT_WALKING then
        set_mario_action(m, ACT_FORWARD_ROLLOUT, 0)
        m.vel.y = 50
        m.faceAngle.y = m.intendedYaw
    end
    if m.action == ACT_BREASTSTROKE and m.controller.buttonDown & Y_BUTTON ~= 0  then
        m.forwardVel = m.forwardVel + 100
    end
    if  m.action == ACT_SLIDE_KICK_SLIDE and m.controller.buttonPressed & Y_BUTTON ~= 0 then
        set_mario_action(m, ACT_SLIDE_KICK, 0)
        m.particleFlags = m.particleFlags | PARTICLE_VERTICAL_STAR
        m.forwardVel = 34
        m.faceAngle.y = m.intendedYaw
    end
    if m.action == ACT_PUNCHING then
       m.forwardVel = m.forwardVel + 60
    end
    if m.action == ACT_JUMP and m.controller.buttonPressed & X_BUTTON ~= 0 then
        set_mario_action(m, ACT_FORWARD_ROLLOUT, 0)
        m.particleFlags = m.particleFlags | PARTICLE_DUST
        m.vel.y = 50
    end
    if m.action == ACT_BACKWARD_AIR_KB and m.controller.buttonPressed & X_BUTTON ~= 0 then
        set_mario_action(m, ACT_BACKWARD_ROLLOUT, 0)
        m.particleFlags = m.particleFlags | PARTICLE_DUST

    elseif m.action == ACT_FORWARD_AIR_KB and m.controller.buttonPressed & X_BUTTON ~= 0 then
        set_mario_action(m, ACT_BACKWARD_ROLLOUT, 0)
        m.particleFlags = m.particleFlags | PARTICLE_DUST

    elseif m.action == ACT_BACKWARD_GROUND_KB and m.controller.buttonPressed & X_BUTTON ~= 0 then
        set_mario_action(m, ACT_BACKWARD_ROLLOUT, 0)
        m.particleFlags = m.particleFlags | PARTICLE_DUST

    elseif m.action == ACT_FORWARD_GROUND_KB and m.controller.buttonPressed & X_BUTTON ~= 0 then
        set_mario_action(m, ACT_BACKWARD_ROLLOUT, 0)
        m.particleFlags = m.particleFlags | PARTICLE_DUST

    end
end

function mario_update() -- by @YTGolder

    if m.controller.buttonDown & Y_BUTTON ~= 0 and m.action == ACT_WALKING or m.action == ACT_HOLD_WALKING and m.controller.buttonDown & Y_BUTTON ~= 0  then
        YBtBoost = YBtBoost + 0.025
    else
        YBtBoost = YBtBoost - 0.025
    end
    if YBtBoost < 0 then
        YBtBoost = 0
    end
    if YBtBoost > 30 then
        YBtBoost = 30
    end


end

hook_event(HOOK_BEFORE_PHYS_STEP, before_phys_step)
hook_event(HOOK_MARIO_UPDATE, mario_update)