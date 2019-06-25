local tablex = require "pl.tablex"
local api = {}


--Textures are set in the same order between meshes that go into meshSets to be able to find corresponding ones by IDs
api.meshTextureMaps = {
   --HUMANS
   { meshes   = { "human_male_head", "human_male_head_jack", "human_male_head_fat", "human_male_head_thin", "human_male_head_big", },
     textures = { "human_male_head_1_dif.dds", "human_male_head_black_dif.dds", "human_male_head_yellow_dif.dds", "human_male_head_red_dif.dds",
                  "human_dead_head_dif_1.dds", "human_dead_head_dif_2.dds",
                  "human_male_head_grey_dif.dds", "human_male_head_white_dif.dds", "human_male_head_ginger_dif.dds", "human_male_head_jack_dif.dds" }, },

   { meshes   = { "human_male_legs", },
     textures = { "human_male_legs_1_diff.dds", "human_male_legs_black_diff.dds", "human_male_legs_yellow_diff.dds", "human_male_legs_red_diff.dds",
                  "human_dead_legs_dif_1.dds", "human_dead_legs_dif_2.dds", }, },

   { meshes   = { "human_male_top", "human_male_top_arms", "human_male_top_hands", },
     textures = { "human_male_top_dif.dds", "human_male_top_black_dif.dds", "human_male_top_yellow_dif.dds", "human_male_top_red_dif.dds",
                  "human_dead_top_dif_1.dds", "human_dead_top_dif_2.dds", }, },

   --EYES
   { meshes   = { "eye_r", "eye_l", },
     textures = { "abori_eye_1_dif.dds", "abori_eye_2_dif.dds", "abori_eye_3_dif.dds", "abori_eye_4_dif.dds" }, },

   { meshes   = { "human_male_eyes", },
     textures = { "eye_jack_dif.dds", "eye_brown_dif.dds", "eye_grey_dif.dds", "eye_blue_dif.dds", "eye_green_dif.dds", "eye_1_dif.dds", }, },

   --HAIR
   { meshes   = { "hair_long_backward.sbg", "hair_long.sbg", "hair_dreads.sbg", "hair_hipster_ponytail.sbg", "hair_curly_long.sbg", "hair_hipster.sbg", "hair_jack.sbg",
                  "moustache_regular", "moustache_gunslinger_wide", "moustache_round", "moustache_regular_fat", "moustache_gunslinger",
                  "beard_bushy", "beard_bushy_big", "beard_bushy_fat", "beard_bushy_thin", "beard_stubble", "beard_stubble_big", "beard_stubble_fat",
                  "beard_stubble_thin", "beard_whiskers", "beard_whiskers_big", "beard_whiskers_fat", "beard_whiskers_thin", },
     textures = { "human_hair_black_dif.dds", "human_hair_blond_dif.dds", "human_hair_brown_dif.dds", "human_hair_ginger_dif.dds", "human_hair_grey_dif.dds", "human_hair_jack.dds", "human_hair_white_dif.dds", }, },


   --ABORI
   { meshes   = { "abori_head_1", "abori_head_2", "abori_head_3", },
     textures = { "abori_head_dif_1.dds", "abori_head_dif_2.dds", "abori_head_dif_3.dds", "abori_head_dif_4.dds", "abori_dead_head_dif_1.dds", "abori_dead_head_dif_2.dds", "abori_sc_head_dif_1.dds",
                  "abori_sc_head_dif_2.dds", "abori_sc_head_dif_3.dds", "abori_sc_head_dif_4.dds", "abori_sc_head_dif_5.dds", "abori_sc_head_dif_6.dds", }, },

   { meshes   = { "abori_male_legs", "abori_male_top", "abori_male_top_arms", "abori_male_top_hands", },
     textures = { "abori_dif_1.dds", "abori_dif_2.dds", "abori_dif_3.dds", "abori_dif_4.dds", "abori_dead_dif_1.dds", "abori_dead_dif_2.dds", "abori_sh_dif.dds", }, },

   { meshes   = { "band_uparm_right", "band_loarm_right", "band_head", "band_leg_left", "band_ssleg_left", "band_thigh_left", "band_thigh_right", "band_leg_right",
                  "band_loarm_left", "band_ssleg_right", "band_uparm_left", },
     textures = { "abori_bands_dif.dds", "abori_bands_clean_dif.dds", }, },

   { meshes   = { "welder_top_1", "welder_glove_l", "welder_glove_r", "welder_legs_1", },
     textures = { "abori_worker_cloth_dif.dds", "abori_worker_cloth_2_dif.dds", "abori_worker_cloth_3_dif.dds", "barmen_tunic.dds" }, },


   --HULK
   { meshes   = { "hulk_head_base", "hulk_head_angry", "hulk_head_cunning", "hulk_head_retarded", "hulk_head_serious", "hulk_head_smiley", },
     textures = { "hybrid_hulk_head_dif_1.dds", "hybrid_hulk_head_dif_2.dds", "hybrid_hulk_head_dif_3.dds", }, },

   { meshes   = { "hulk_body", "hulk_body_saw", },
     textures = { "hybrid_hulk_dif_1.dds", "hybrid_hulk_dif_2.dds", "hybrid_hulk_dif_3.dds", }, },

   --BUGS
   { meshes   = { "flyer", "grenade", },
     textures = { "neobugs_dif_green.dds", "neobugs_dif_violet.dds" }, },

   --ARPHANT
   { meshes   = { "arphant", },
     textures = { "arphant_diff.dds", "arphant_diff_2.dds" }, },

   --CRUCAS
   { meshes   = { "body", },
     textures = { "crucas_dif.dds", "crucas_dif_2.dds" }, },

   --ITEMS
   { meshes   = { "bandana_1.sbg", },
      textures = { "bandana_dif_1.dds", "bandana_dif_2.dds", "bandana_dif_3.dds", }, },

   { meshes   = { "scamp_22.sbg", },
     textures = { "scamp_22_dif.dds", "scamp_22_yellow_dif.dds", }, },

   { meshes   = { "bandit_3_hat.sbg", },
     textures = { "bandit_3_hat_dif.dds", "barmen_hat.dds", }, },
}

--Sets that can be textured together
api.meshSets = {
   { "human_male_head", "human_male_head_jack", "human_male_head_fat", "human_male_head_thin", "human_male_head_big",
     "human_male_legs", "human_male_top", "human_male_top_arms", "human_male_top_hands", },
   { "hair_long_backward.sbg", "hair_long.sbg", "hair_dreads.sbg", "hair_hipster_ponytail.sbg", "hair_curly_long.sbg", "hair_hipster.sbg", "hair_jack.sbg",
     "moustache_regular", "moustache_gunslinger_wide", "moustache_round", "moustache_regular_fat", "moustache_gunslinger",
     "beard_bushy", "beard_bushy_big", "beard_bushy_fat", "beard_bushy_thin", "beard_stubble", "beard_stubble_big", "beard_stubble_fat",
     "beard_stubble_thin", "beard_whiskers", "beard_whiskers_big", "beard_whiskers_fat", "beard_whiskers_thin", },
   { "eye_r", "eye_l", },
   { "abori_male_legs", "abori_male_top", "abori_male_top_arms", "abori_male_top_hands", "abori_head_1", "abori_head_2", "abori_head_3", },
   { "hulk_head_base", "hulk_head_angry", "hulk_head_cunning", "hulk_head_retarded", "hulk_head_serious", "hulk_head_smiley", "hulk_body", "hulk_body_saw", },
}

function api.getMeshTextures(meshName)
   local textures = {}
   local path = tablex.search(api.meshTextureMaps, meshName)
   if path then
      local index = tonumber(path:match("%[(.*)%]"))
      textures = tablex.deepcopy(api.meshTextureMaps[index].textures)
   end
   return textures
end


function api.getMeshSet(meshName)
   local meshes = {}
   local path = tablex.search(api.meshSets, meshName)
   if path then
      local index = tonumber(path:match("%[(.*)%]"))
      meshes = tablex.deepcopy(api.meshSets[index])
   end
   return meshes
end

return api
