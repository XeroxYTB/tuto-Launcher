# ══════════════════════════════════════════
# TDM - INITIALISATION
# Appelé au chargement du datapack
# ══════════════════════════════════════════

# --- Scoreboards ---
scoreboard objectives remove tdm_kills
scoreboard objectives remove tdm_deaths
scoreboard objectives remove tdm_dead
scoreboard objectives remove tdm_state
scoreboard objectives remove tdm_count

scoreboard objectives add tdm_kills playerKillCount "Kills"
scoreboard objectives add tdm_deaths deathCount
scoreboard objectives add tdm_dead dummy
scoreboard objectives add tdm_state dummy
scoreboard objectives add tdm_count dummy

scoreboard objectives setdisplay sidebar tdm_kills

scoreboard players set #game tdm_state 0
scoreboard players set #red_alive tdm_count 0
scoreboard players set #blue_alive tdm_count 0

# --- Equipes ---
team remove red
team remove blue

team add red
team add blue

team modify red color red
team modify blue color blue
team modify red displayName {"text":"Rouge"}
team modify blue displayName {"text":"Bleu"}
team modify red prefix {"text":"[ROUGE] ","color":"red"}
team modify blue prefix {"text":"[BLEU] ","color":"blue"}
team modify red friendlyFire false
team modify blue friendlyFire false
team modify red nametagVisibility always
team modify blue nametagVisibility always
team modify red deathMessageVisibility always
team modify blue deathMessageVisibility always
team modify red collisionRule pushOtherTeams
team modify blue collisionRule pushOtherTeams

# --- Gamerules ---
gamerule doImmediateRespawn true
gamerule showDeathMessages true
gamerule keepInventory false
gamerule naturalRegeneration true
gamerule doDaylightCycle false
gamerule doWeatherCycle false
gamerule announceAdvancements false
gamerule spectatorsGenerateChunks false

# --- Reset joueurs ---
scoreboard players set @a tdm_dead 0
scoreboard players set @a tdm_deaths 0
scoreboard players set @a tdm_kills 0
effect clear @a

# --- Supprimer anciens marqueurs ---
kill @e[tag=tdm]

# --- Message ---
tellraw @a ["",{"text":"══════════════════════════════════","color":"gold"},"\n",{"text":"  ⚔ TEAM DEATHMATCH ⚔","color":"gold","bold":true},"\n",{"text":"  Rouge vs Bleu","color":"gray"},"\n",{"text":"══════════════════════════════════","color":"gold"},"\n",{"text":"  /function tdm:setup/lobby","color":"green","clickEvent":{"action":"suggest_command","value":"/function tdm:setup/lobby"}},{"text":" → Créer le lobby","color":"gray"},"\n",{"text":"  /function tdm:game/start","color":"green","clickEvent":{"action":"suggest_command","value":"/function tdm:game/start"}},{"text":" → Lancer la partie","color":"gray"},"\n",{"text":"  /function tdm:game/reset","color":"green","clickEvent":{"action":"suggest_command","value":"/function tdm:game/reset"}},{"text":" → Réinitialiser","color":"gray"},"\n",{"text":"══════════════════════════════════","color":"gold"}]
