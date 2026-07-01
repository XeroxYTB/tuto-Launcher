# ══════════════════════════════════════════
# TDM - CRÉER LE LOBBY
# Place les marqueurs et les blocs de join
# Exécutez cette commande là où vous voulez
# le centre du lobby. Les spawns d'équipe
# sont à 30 blocs de chaque côté.
# ══════════════════════════════════════════

# Supprimer les anciens marqueurs
kill @e[tag=tdm]

# --- Marqueur du lobby (position actuelle) ---
summon armor_stand ~ ~ ~ {Tags:["tdm","tdm_lobby"],CustomName:'{"text":"⚔ Lobby TDM","color":"gold"}',CustomNameVisible:1b,Invisible:1b,Marker:1b,NoGravity:1b}

# --- Zone de join ROUGE (3 blocs vers +X) ---
summon armor_stand ~3 ~ ~0 {Tags:["tdm","tdm_join_red"],CustomName:'{"text":"➜ Rejoindre ROUGE","color":"red"}',CustomNameVisible:1b,Invisible:1b,Marker:1b,NoGravity:1b}

# Plateforme rouge
setblock ~3 ~-1 ~0 minecraft:red_concrete
setblock ~2 ~-1 ~0 minecraft:red_concrete
setblock ~4 ~-1 ~0 minecraft:red_concrete
setblock ~3 ~-1 ~1 minecraft:red_concrete
setblock ~3 ~-1 ~-1 minecraft:red_concrete
setblock ~3 ~ ~0 minecraft:heavy_weighted_pressure_plate

# --- Zone de join BLEUE (3 blocs vers -X) ---
summon armor_stand ~-3 ~ ~0 {Tags:["tdm","tdm_join_blue"],CustomName:'{"text":"➜ Rejoindre BLEU","color":"blue"}',CustomNameVisible:1b,Invisible:1b,Marker:1b,NoGravity:1b}

# Plateforme bleue
setblock ~-3 ~-1 ~0 minecraft:blue_concrete
setblock ~-2 ~-1 ~0 minecraft:blue_concrete
setblock ~-4 ~-1 ~0 minecraft:blue_concrete
setblock ~-3 ~-1 ~1 minecraft:blue_concrete
setblock ~-3 ~-1 ~-1 minecraft:blue_concrete
setblock ~-3 ~ ~0 minecraft:heavy_weighted_pressure_plate

# --- Spawn équipe ROUGE (30 blocs vers +X) ---
summon armor_stand ~30 ~ ~0 {Tags:["tdm","tdm_red_spawn"],CustomName:'{"text":"⚑ Spawn Rouge","color":"red"}',CustomNameVisible:1b,Invisible:1b,Marker:1b,NoGravity:1b}

# --- Spawn équipe BLEUE (30 blocs vers -X) ---
summon armor_stand ~-30 ~ ~0 {Tags:["tdm","tdm_blue_spawn"],CustomName:'{"text":"⚑ Spawn Bleu","color":"blue"}',CustomNameVisible:1b,Invisible:1b,Marker:1b,NoGravity:1b}

# --- Message d'instructions ---
tellraw @a ["",{"text":"══════════════════════════════════","color":"gold"},"\n",{"text":"  ✔ Lobby TDM créé !","color":"green","bold":true},"\n",{"text":"══════════════════════════════════","color":"gold"},"\n",{"text":"  • ","color":"gray"},{"text":"Plaque ROUGE","color":"red"},{"text":" → rejoindre les Rouges","color":"gray"},"\n",{"text":"  • ","color":"gray"},{"text":"Plaque BLEUE","color":"blue"},{"text":" → rejoindre les Bleus","color":"gray"},"\n",{"text":"  • ","color":"gray"},{"text":"/function tdm:leave","color":"yellow"},{"text":" → quitter son équipe","color":"gray"},"\n",{"text":"  • ","color":"gray"},{"text":"/function tdm:game/start","color":"green"},{"text":" → lancer la partie","color":"gray"},"\n",{"text":"══════════════════════════════════","color":"gold"},"\n",{"text":"  ℹ Déplacez les armor stands","color":"aqua"},"\n",{"text":"    pour changer les spawns d'équipe","color":"aqua"},"\n",{"text":"    (tag tdm_red_spawn / tdm_blue_spawn)","color":"dark_aqua"}]
