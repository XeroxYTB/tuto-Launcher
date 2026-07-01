# ══════════════════════════════════════════
# TDM - BOUCLE PRINCIPALE (chaque tick)
# ══════════════════════════════════════════

# --- LOBBY (state 0) : détection join ---
execute if score #game tdm_state matches 0 as @a[team=!red,team=!blue] at @e[tag=tdm_join_red,limit=1] if entity @s[distance=..1.5] run function tdm:join/red
execute if score #game tdm_state matches 0 as @a[team=!red,team=!blue] at @e[tag=tdm_join_blue,limit=1] if entity @s[distance=..1.5] run function tdm:join/blue

# --- PARTIE ACTIVE (state 1) ---
execute if score #game tdm_state matches 1 run function tdm:game/tick
