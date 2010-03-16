----------------------------------------------------------------
--  GAME DEFINITION : Strife
----------------------------------------------------------------
--
--  Oblige Level Maker
--
--  Copyright (C) 2009 Andrew Apted
--
--  This program is free software; you can redistribute it and/or
--  modify it under the terms of the GNU General Public License
--  as published by the Free Software Foundation; either version 2
--  of the License, or (at your option) any later version.
--
--  This program is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU General Public License for more details.
--
----------------------------------------------------------------

STRIFE_THINGS =
{
  --- special stuff ---
  player1 = { id=1, kind="other", r=16,h=56 },
  player2 = { id=2, kind="other", r=16,h=56 },
  player3 = { id=3, kind="other", r=16,h=56 },
  player4 = { id=4, kind="other", r=16,h=56 },

  dm_player     = { id=11, kind="other", r=16,h=56 },
  teleport_spot = { id=14, kind="other", r=16,h=56 },

  --- monsters ---
  acolyte = { id=1234, kind="monster", r=16,h=56 },

  -- bosses

  --- pickups ---
  k_yellow   = { id=80, kind="pickup", r=20,h=16, pass=true },

  --- scenery ---
  wall_torch  = { id=50, kind="scenery", r=10,h=64, light=255 },

}


----------------------------------------------------------------

STRIFE_MATERIALS =
{
  -- special materials --
  _ERROR = { t="BIGSTN02", f="P_SPLATR" },
  _SKY   = { t="BIGSTN01", f="F_SKY001"  },

  -- textures --

  BRKGRY01 = { t="BRKGRY01", f="F_BRKTOP" },
  BRKGRY17 = { t="BRKGRY17", f="F_BRKTOP" },
  WALCAV01 = { t="WALCAV01", f="F_CAVE01" },

  -- flats --

  F_BRKTOP = { t="BRKGRY01", f="F_BRKTOP" },
  F_CAVE01 = { t="WALCAV01", f="F_CAVE01" },

}


STRIFE_SANITY_MAP =
{
  -- FIXME
}


----------------------------------------------------------------

STRIFE_COMBOS =
{
  BRICK1 =
  {
    wall = "BRKGRY01"
  },

  CAVE1 =
  {
    outdoor = true,

    wall  = "WALCAV01",
    floor = "WALCAV01",
    ceil  = "WALCAV01",
  }
}


STRIFE_SUB_THEMES =
{
  TECH =
  {
    building_walls =
    {
      BRICK1=50,
    },

    building_floors =
    {
      F_BRKTOP=50,
    },

    building_ceilings =
    {
      F_BRKTOP=50,
    },

    courtyard_floors =
    {
      CAVE1=20,
    },
  }, -- TECH
}


------------------------------------------------------------

STRIFE_MONSTERS =
{
  -- FIXME : STRIFE_MONSTERS
}


STRIFE_WEAPONS =
{
  dagger =
  {
    rate=1.5, damage=10, attack="melee",
  },

  -- FIXME : STRIFE_WEAPONS
}


STRIFE_PICKUPS =
{
  -- FIXME : STRIFE_PICKUPS
}


STRIFE_PLAYER_MODEL =
{
  strifeguy =
  {
    stats = { health=0, bolt=0, bullet=0, missile=0,
              grenade=0, cell=0 },

    weapons = { dagger=1 },
  }
}


------------------------------------------------------------


function Strife_setup()
  -- nothing needed
end


function Strife_get_levels()
  local EP_NUM  = 1
  local MAP_NUM = 1

  if OB_CONFIG.length == "few"     then MAP_NUM = 4 end
  if OB_CONFIG.length == "episode" then MAP_NUM = 9 end
  if OB_CONFIG.length == "full"    then MAP_NUM = 9 ; EP_NUM = 3 end

  for episode = 1,EP_NUM do
    for map = 1,MAP_NUM do

      local LEV =
      {
        name = string.format("MAP%d%d", episode-1, map),

        episode  = episode,
        ep_along = map / MAP_NUM,
        ep_info  = { },

        keys = { foo=50 },
        switches = { foo=50 },
        bars = { },
      }

      table.insert(GAME.all_levels, LEV)
    end -- for map

  end -- for episode
end



------------------------------------------------------------


UNFINISHED["strife"] =
{
  label = "Strife",

  setup_func = Strife_setup,
  levels_start_func = Strife_get_levels,

  param =
  {
    format = "doom",

    rails = true,
    switches = true,
    liquids = true,
    teleporters = true,
    noblaze_door = true,

    no_keys = true,

    seed_size = 256,

    max_name_length = 28,

    skip_monsters = { 20,30 },

    mon_time_max = 12,

    mon_damage_max  = 200,
    mon_damage_high = 100,
    mon_damage_low  =   1,

    ammo_factor   = 0.8,
    health_factor = 0.7,
  },

  tables =
  {
    "player_model", STRIFE_PLAYER_MODEL,
    
    "things",   STRIFE_THINGS,
    "monsters", STRIFE_MONSTERS,
    "weapons",  STRIFE_WEAPONS,
    "pickups",  STRIFE_PICKUPS,

    "materials", STRIFE_MATERIALS,
    "sub_themes",  STRIFE_SUB_THEMES,
  },
}

