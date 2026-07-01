# ══════════════════════════════════════════
# TDM - RÉINITIALISER LA PARTIE
# ══════════════════════════════════════════

# Annuler les countdowns en attente
schedule clear tdm:game/countdown_2
schedule clear tdm:game/countdown_1
schedule clear tdm:game/go
schedule clear tdm:game/reset

# État lobby
scoreboard players set #game tdm_state 0

# Reset tous les scores
scoreboard players set @a tdm_dead 0
scoreboard players set @a tdm_kills 0
scoreboard players set @a tdm_deaths 0

# Enlever tous les effets
effect clear @a

# Téléporter tout le monde au lobby
execute at @e[tag=tdm_lobby,limit=1] run tp @a ~ ~ ~

# Mode aventure pour tous
gamemode adventure @a

# Retirer des équipes
team leave @a

# Vider les inventaires
clear @a

# Message
tellraw @a ["",{"text":"══════════════════════════════════","color":"gold"},"\n",{"text":"  ♻ PARTIE RÉINITIALISÉE","color":"yellow","bold":true},"\n",{"text":"  Marchez sur une plaque pour rejoindre !","color":"gray"},"\n",{"text":"══════════════════════════════════","color":"gold"}]
playsound minecraft:block.note_block.bell master @a ~ ~ ~ 1 1
