local templatesList =
{
   --A template table to spawn items with specified properties through a 'table_name.tmpl' reference instead of 'item_name.itm'
   --Quantity should be set as usual 'table_name.tmpl, 5'
   --Examples
   ["test_revolver.tmpl"] = {
      itemName = "revolver.gun",
      quality = 4,
      magazine = 3,
   },
   ["rusty_machete.tmpl"] = {
      itemName = "machete.wpn",
      quality = 1,
   },
   ["shiny_machete.tmpl"] = {
      itemName = "machete.wpn",
      quality = 4,
   },
   --End of Examples
   ["weathered_abori_axe.tmpl"] = {
      itemName = "abori_axe.wpn",
      quality = 1,
   },
   ["good_abori_axe.tmpl"] = {
      itemName = "abori_axe.wpn",
      quality = 2,
   },
   ["exceptional_abori_axe.tmpl"] = {
      itemName = "abori_axe.wpn",
      quality = 3,
   },
   ["mastercrafted_abori_axe.tmpl"] = {
      itemName = "abori_axe.wpn",
      quality = 4,
   },
   ["weathered_abori_bat.tmpl"] = {
      itemName = "abori_bat.wpn",
      quality = 1,
   },
   ["good_abori_bat.tmpl"] = {
      itemName = "abori_bat.wpn",
      quality = 2,
   },
   ["exceptional_abori_bat.tmpl"] = {
      itemName = "abori_bat.wpn",
      quality = 3,
   },
   ["mastercrafted_abori_bat.tmpl"] = {
      itemName = "abori_bat.wpn",
      quality = 4,
   },
   ["weathered_abori_knife.tmpl"] = {
      itemName = "abori_knife.wpn",
      quality = 1,
   },
   ["good_abori_knife.tmpl"] = {
      itemName = "abori_knife.wpn",
      quality = 2,
   },
   ["exceptional_abori_knife.tmpl"] = {
      itemName = "abori_knife.wpn",
      quality = 3,
   },
   ["mastercrafted_abori_knife.tmpl"] = {
      itemName = "abori_knife.wpn",
      quality = 4,
   },
   ["weathered_axe.tmpl"] = {
      itemName = "axe.wpn",
      quality = 1,
   },
   ["good_axe.tmpl"] = {
      itemName = "axe.wpn",
      quality = 2,
   },
   ["exceptional_axe.tmpl"] = {
      itemName = "axe.wpn",
      quality = 3,
   },
   ["mastercrafted_axe.tmpl"] = {
      itemName = "axe.wpn",
      quality = 4,
   },
   ["weathered_beacon_light.tmpl"] = {
      itemName = "beacon_light.wpn",
      quality = 1,
   },
   ["good_beacon_light.tmpl"] = {
      itemName = "beacon_light.wpn",
      quality = 2,
   },
   ["exceptional_beacon_light.tmpl"] = {
      itemName = "beacon_light.wpn",
      quality = 3,
   },
   ["mastercrafted_beacon_light.tmpl"] = {
      itemName = "beacon_light.wpn",
      quality = 4,
   },
   ["weathered_carbine_0.tmpl"] = {
      itemName = "carbine.gun",
      magazine = 0, --Specifying full clip is not needed as it's completely filled with ammo by default
      quality = 1,
   },
   ["weathered_carbine_2.tmpl"] = {
      itemName = "carbine.gun",
      magazine = 2,
      quality = 1,
   },
   ["good_carbine_5.tmpl"] = {
      itemName = "carbine.gun",
      magazine = 5,
      quality = 2,
   },
   ["good_carbine_2.tmpl"] = {
      itemName = "carbine.gun",
      magazine = 2,
      quality = 2,
   },
   ["exceptional_carbine_8.tmpl"] = {
      itemName = "carbine.gun",
      magazine = 8,
      quality = 3,
   },
   ["mastercrafted_carbine.tmpl"] = {
      itemName = "carbine.gun",
      quality = 4,
   },
   ["weathered_cleaver.tmpl"] = {
      itemName = "cleaver.wpn",
      quality = 1,
   },
   ["good_cleaver.tmpl"] = {
      itemName = "cleaver.wpn",
      quality = 2,
   },
   ["exceptional_cleaver.tmpl"] = {
      itemName = "cleaver.wpn",
      quality = 3,
   },
   ["mastercrafted_cleaver.tmpl"] = {
      itemName = "cleaver.wpn",
      quality = 4,
   },
   ["weathered_flaregun.tmpl"] = {
      itemName = "flaregun.gun",
      quality = 1,
   },
   ["good_flaregun.tmpl"] = {
      itemName = "flaregun.gun",
      quality = 2,
   },
   ["exceptional_flaregun.tmpl"] = {
      itemName = "flaregun.gun",
      quality = 3,
   },
   ["mastercrafted_flaregun.tmpl"] = {
      itemName = "flaregun.gun",
      quality = 4,
   },
   ["weathered_howdah.tmpl"] = {
      itemName = "howdah.gun",
      quality = 1,
   },
   ["good_howdah.tmpl"] = {
      itemName = "howdah.gun",
      quality = 2,
   },
   ["exceptional_howdah.tmpl"] = {
      itemName = "howdah.gun",
      quality = 3,
   },
   ["mastercrafted_howdah.tmpl"] = {
      itemName = "howdah.gun",
      quality = 4,
   },
  ["weathered_kabarog_hsg_0.tmpl"] = {
      itemName = "kabarog_hsg.gun",
      magazine = 0,
      quality = 1,
   },
   ["weathered_kabarog_hsg_2.tmpl"] = {
      itemName = "kabarog_hsg.gun",
      magazine = 2,
      quality = 1,
   },
   ["good_kabarog_hsg_3.tmpl"] = {
      itemName = "kabarog_hsg.gun",
      magazine = 3,
      quality = 2,
   },
   ["good_kabarog_hsg_2.tmpl"] = {
      itemName = "kabarog_hsg.gun",
      magazine = 2,
      quality = 2,
   },
   ["exceptional_kabarog_hsg_5.tmpl"] = {
      itemName = "kabarog_hsg.gun",
      magazine = 5,
      quality = 3,
   },
   ["mastercrafted_kabarog_hsg.tmpl"] = {
      itemName = "kabarog_hsg.gun",
      quality = 4,
   },
   ["weathered_machete.tmpl"] = {
      itemName = "machete.wpn",
      quality = 1,
   },
   ["good_machete.tmpl"] = {
      itemName = "machete.wpn",
      quality = 2,
   },
   ["exceptional_machete.tmpl"] = {
      itemName = "machete.wpn",
      quality = 3,
   },
   ["mastercrafted_machete.tmpl"] = {
      itemName = "machete.wpn",
      quality = 4,
   },
   ["weathered_pickaxe.tmpl"] = {
      itemName = "pickaxe.wpn",
      quality = 1,
   },
   ["good_pickaxe.tmpl"] = {
      itemName = "pickaxe.wpn",
      quality = 2,
   },
   ["exceptional_pickaxe.tmpl"] = {
      itemName = "pickaxe.wpn",
      quality = 3,
   },
   ["mastercrafted_pickaxe.tmpl"] = {
      itemName = "pickaxe.wpn",
      quality = 4,
   },
   ["weathered_pipe.tmpl"] = {
      itemName = "pipe.wpn",
      quality = 1,
   },
   ["good_pipe.tmpl"] = {
      itemName = "pipe.wpn",
      quality = 2,
   },
   ["exceptional_pipe.tmpl"] = {
      itemName = "pipe.wpn",
      quality = 3,
   },
   ["mastercrafted_pipe.tmpl"] = {
      itemName = "pipe.wpn",
      quality = 4,
   },
   ["weathered_revolver_0.tmpl"] = {
      itemName = "revolver.gun",
      magazine = 0,
      quality = 1,
   },
   ["weathered_revolver_2.tmpl"] = {
      itemName = "revolver.gun",
      magazine = 2,
      quality = 1,
   },
   ["good_revolver_3.tmpl"] = {
      itemName = "revolver.gun",
      magazine = 3,
      quality = 2,
   },
   ["good_revolver_2.tmpl"] = {
      itemName = "revolver.gun",
      magazine = 2,
      quality = 2,
   },
   ["exceptional_revolver_5.tmpl"] = {
      itemName = "revolver.gun",
      magazine = 5,
      quality = 3,
   },
   ["mastercrafted_revolver.tmpl"] = {
      itemName = "revolver.gun",
      quality = 4,
   },
   ["weathered_scamp_22_0.tmpl"] = {
      itemName = "scamp_22.gun",
      magazine = 0,
      quality = 1,
   },
   ["weathered_scamp_22_2.tmpl"] = {
      itemName = "scamp_22.gun",
      magazine = 2,
      quality = 1,
   },
   ["good_scamp_22_5.tmpl"] = {
      itemName = "scamp_22.gun",
      magazine = 5,
      quality = 2,
   },
   ["good_scamp_22_2.tmpl"] = {
      itemName = "scamp_22.gun",
      magazine = 2,
      quality = 2,
   },
   ["exceptional_scamp_22_8.tmpl"] = {
      itemName = "scamp_22.gun",
      magazine = 8,
      quality = 3,
   },
   ["mastercrafted_scamp_22.tmpl"] = {
      itemName = "scamp_22.gun",
      quality = 4,
   },
   ["weathered_scamp_22_shock.tmpl"] = {
      itemName = "scamp_22_shock.gun",
      quality = 1,
   },
   ["good_scamp_22_shock.tmpl"] = {
      itemName = "scamp_22_shock.gun",
      quality = 2,
   },
   ["exceptional_scamp_22_shock.tmpl"] = {
      itemName = "scamp_22_shock.gun",
      quality = 3,
   },
   ["mastercrafted_scamp_22_shock.tmpl"] = {
      itemName = "scamp_22_shock.gun",
      quality = 4,
   },
   ["weathered_shotgun_0.tmpl"] = {
      itemName = "shotgun.gun",
      magazine = 0,
      quality = 1,
   },
   ["weathered_shotgun_2.tmpl"] = {
      itemName = "shotgun.gun",
      magazine = 2,
      quality = 1,
   },
   ["good_shotgun_3.tmpl"] = {
      itemName = "shotgun.gun",
      magazine = 3,
      quality = 2,
   },
   ["good_shotgun_2.tmpl"] = {
      itemName = "shotgun.gun",
      magazine = 2,
      quality = 2,
   },
   ["exceptional_shotgun_5.tmpl"] = {
      itemName = "shotgun.gun",
      magazine = 5,
      quality = 3,
   },
   ["mastercrafted_shotgun.tmpl"] = {
      itemName = "shotgun.gun",
      quality = 4,
   },
   ["mastercrafted_shotgun_2.tmpl"] = {
      itemName = "shotgun.gun",
      magazine = 2,
      quality = 4,
   },
   ["weathered_shovel.tmpl"] = {
      itemName = "shovel.wpn",
      quality = 1,
   },
   ["good_shovel.tmpl"] = {
      itemName = "shovel.wpn",
      quality = 2,
   },
   ["exceptional_shovel.tmpl"] = {
      itemName = "shovel.wpn",
      quality = 3,
   },
   ["mastercrafted_shovel.tmpl"] = {
      itemName = "shovel.wpn",
      quality = 4,
   },
   ["weathered_sledgehammer.tmpl"] = {
      itemName = "sledgehammer.wpn",
      quality = 1,
   },
   ["good_sledgehammer.tmpl"] = {
      itemName = "sledgehammer.wpn",
      quality = 2,
   },
   ["exceptional_sledgehammer.tmpl"] = {
      itemName = "sledgehammer.wpn",
      quality = 3,
   },
   ["mastercrafted_sledgehammer.tmpl"] = {
      itemName = "sledgehammer.wpn",
      quality = 4,
   },
}

return templatesList
