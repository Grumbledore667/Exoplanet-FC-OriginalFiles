local tablex = require "pl.tablex"
local stringx = require "pl.stringx"
local api = {}

-- Texture sets are organized to be filled manually with no repetitions for different meshes or prefabs

api.meshTextureMaps = {
   skin = {
      abori = {
         ["1"] = { meshes = { "abori_head_1", "abori_head_2", "abori_head_3", },
                 textures = { "abori_head_dif_1.dds", "abori_head_dif_2.dds", "abori_head_dif_3.dds", }, },

         ["2"] = { meshes = { "abori_male_legs", "abori_male_top", },
                 textures = { "abori_dif_1.dds", "abori_dif_2.dds", "abori_dif_3.dds", }, },
      },

      hulk = {
         ["1"] = { meshes = { "hulk_head_base", "hulk_head_angry", "hulk_head_cunning", "hulk_head_retarded", "hulk_head_serious", "hulk_head_smiley", },
                 textures = { "hybrid_hulk_head_dif_1.dds", "hybrid_hulk_head_dif_2.dds", "hybrid_hulk_head_dif_3.dds", }, },

         ["2"] = { meshes = { "hulk_body", "hulk_body_saw", },
                 textures = { "hybrid_hulk_dif_1.dds", "hybrid_hulk_dif_2.dds", "hybrid_hulk_dif_3.dds", }, },
      },
   },

   eyes = {
      abori_hulk = {
         ["1"] = { meshes = { "eye_r", "eye_l", },
                 textures = { "abori_eye_1_dif.dds", "abori_eye_2_dif.dds", "abori_eye_3_dif.dds", "abori_eye_4_dif.dds" }, },
      },
   },
}

function api.getCharacterMeshTextureMap( char )
   local prefabName = char:getPrefabName():gsub(".cfg", "")
   local t = {}
   for setName,meshTextureMap in pairs( api.meshTextureMaps ) do
      if meshTextureMap[prefabName] then
         t[setName] = tableDeepCopy( meshTextureMap[prefabName] )
      else --means we probably have his textures in a joint table so we iterate 1 lvl deeper
         for prefabSetName,prefabSet in pairs( meshTextureMap ) do
            if prefabSetName:find( prefabName ) then
               t[setName] = tableDeepCopy( prefabSet )
            end
         end
      end
   end
   return t
end

function api.getCharacterMeshTextures( meshName )
   local textures = {}
   local path = tablex.search(api.meshTextureMaps, meshName)
   if path then
      path = stringx.split(path,".")
      textures = api.meshTextureMaps[path[1]][path[2]][path[3]].textures
   end
   return textures
end

function api.getTextureCount( char, meshTextureMapName )
   local prefabName = char:getPrefabName():gsub(".cfg", "")
   if api.meshTextureMaps[meshTextureMapName] and api.meshTextureMaps[meshTextureMapName][prefabName] then
      return #api.meshTextureMaps[meshTextureMapName][prefabName]["1"].textures
   else return 0
   end
end

return api
