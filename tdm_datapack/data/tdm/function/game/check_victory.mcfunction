# ══════════════════════════════════════════
# TDM - VÉRIFIER LA VICTOIRE
# ══════════════════════════════════════════

# Rouge éliminé, Bleu gagne
execute if score #red_alive tdm_count matches 0 if score #blue_alive tdm_count matches 1.. run function tdm:game/blue_wins

# Bleu éliminé, Rouge gagne
execute if score #blue_alive tdm_count matches 0 if score #red_alive tdm_count matches 1.. run function tdm:game/red_wins

# Égalité (les deux éliminés en même temps)
execute if score #red_alive tdm_count matches 0 if score #blue_alive tdm_count matches 0 run function tdm:game/draw
