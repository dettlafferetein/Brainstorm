local lovely = require("lovely")
local nativefs = require("nativefs")

local tag_list = {
  ["None"] = "",
  ["Uncommon Tag"] = "tag_uncommon",
  ["Rare Tag"] = "tag_rare",
  ["Holographic Tag"] = "tag_holo",
  ["Foil Tag"] = "tag_foil",
  ["Polychrome Tag"] = "tag_polychrome",
  ["Investment Tag"] = "tag_investment",
  ["Voucher Tag"] = "tag_voucher",
  ["Boss Tag"] = "tag_boss",
  ["Charm Tag"] = "tag_charm",
  ["Juggle Tag"] = "tag_juggle",
  ["Double Tag"] = "tag_double",
  ["Coupon Tag"] = "tag_coupon",
  ["Economy Tag"] = "tag_economy",
  ["Skip Tag"] = "tag_skip",
  ["D6 Tag"] = "tag_d_six",
}

local voucher_list = {
  ["None"] = "",
  ["Overstock"] = "v_overstock_norm",
  ["Clearance Sale"] = "v_clearance_sale",
  ["Hone"] = "v_hone",
  ["Reroll Surplus"] = "v_reroll_surplus",
  ["Crystal Ball"] = "v_crystal_ball",
  ["Telescope"] = "v_telescope",
  ["Grabber"] = "v_grabber",
  ["Wasteful"] = "v_wasteful",
  ["Tarot Merchant"] = "v_tarot_merchant",
  ["Planet Merchant"] = "v_planet_merchant",
  ["Seed Money"] = "v_seed_money",
  ["Blank"] = "v_blank",
  ["Magic Trick"] = "v_magic_trick",
  ["Hieroglyph"] = "v_hieroglyph",
  ["Director's Cut"] = "v_directors_cut",
  ["Paint Brush"] = "v_paint_brush",
}
local pack_list = {
  ["None"] = {},
  ["Normal Arcana"] = {
    "p_arcana_normal_1",
    "p_arcana_normal_2",
    "p_arcana_normal_3",
    "p_arcana_normal_4",
  },
  ["Jumbo Arcana"] = { "p_arcana_jumbo_1", "p_arcana_jumbo_2" },
  ["Mega Arcana"] = { "p_arcana_mega_1", "p_arcana_mega_2" },
  ["Normal Celestial"] = {
    "p_celestial_normal_1",
    "p_celestial_normal_2",
    "p_celestial_normal_3",
    "p_celestial_normal_4",
  },
  ["Jumbo Celestial"] = { "p_celestial_jumbo_1", "p_celestial_jumbo_2" },
  ["Mega Celestial"] = { "p_celestial_mega_1", "p_celestial_mega_2" },
  ["Normal Standard"] = {
    "p_standard_normal_1",
    "p_standard_normal_2",
    "p_standard_normal_3",
    "p_standard_normal_4",
  },
  ["Jumbo Standard"] = { "p_standard_jumbo_1", "p_standard_jumbo_2" },
  ["Mega Standard"] = { "p_standard_mega_1", "p_standard_mega_2" },
  ["Normal Buffoon"] = { "p_buffoon_normal_1", "p_buffoon_normal_2" },
  ["Jumbo Buffoon"] = { "p_buffoon_jumbo_1" },
  ["Mega Buffoon"] = { "p_buffoon_mega_1" },
  ["Normal Spectral"] = { "p_spectral_normal_1", "p_spectral_normal_2" },
  ["Jumbo Spectral"] = { "p_spectral_jumbo_1" },
  ["Mega Spectral"] = { "p_spectral_mega_1" },
}
local spf_list = {
  ["500"] = 500,
  ["750"] = 750,
  ["1000"] = 1000,
}
local rare_joker_list = {
	["None"] = "",
	["DNA"] = "j_dna",
	["Vagabond"] = "j_vagabond",
	["Baron"] = "j_baron",
	["Obelisk"] = "j_obelisk",
	["Baseball Card"] = "j_baseball",
	["Ancient Joker"] = "j_ancient",
	["Campfire"] = "j_campfire",
	["Blueprint"] = "j_blueprint",
	["Wee Joker"] = "j_wee",
	["Hit the Road"] = "j_hit_the_road",
	["The Duo"] = "j_duo",
	["The Trio"] = "j_trio",
	["The Family"] = "j_family",
	["The Order"] = "j_order",
	["The Tribe"] = "j_tribe",
	["Stuntman"] = "j_stuntman",
	["Invisible Joker"] = "j_invisible",
	["Brainstorm"] = "j_brainstorm",
	["Driver's License"] = "j_drivers_license",
	["Burnt Joker"] = "j_burnt",
}
local uncommon_joker_list = {
	["None"] = "",
	["Joker Stencil"] = "j_stencil",
	["Four Fingers"] = "j_four_fingers",
	["Mime"] = "j_mime",
	["Ceremonial Dagger"] = "j_ceremonial",
	["Marble Joker"] = "j_marble",
	["Loyalty Card"] = "j_loyalty_card",
	["Dusk"] = "j_dusk",
	["Fibonacci"] = "j_fibonacci",
	["Steel Joker"] = "j_steel_joker",
	["Hack"] = "j_hack",
	["Pareidolia"] = "j_pareidolia",
	["Space Joker"] = "j_space",
	["Burglar"] = "j_burglar",
	["Blackboard"] = "j_blackboard",
	["Sixth Sense"] = "j_sixth_sense",
	["Constellation"] = "j_constellation",
	["Hiker"] = "j_hiker",
	["Card Sharp"] = "j_card_sharp",
	["Madness"] = "j_madness",
	["Seance"] = "j_seance",
	["Vampire"] = "j_vampire",
	["Shortcut"] = "j_shortcut",
	["Hologram"] = "j_hologram",
	["Cloud 9"] = "j_cloud_9",
	["Rocket"] = "j_rocket",
	["Midas Mask"] = "j_midas_mask",
	["Luchador"] = "j_luchador",
	["Gift Card"] = "j_gift",
	["Turtle Bean"] = "j_turtle_bean",
	["Erosion"] = "j_erosion",
	["To the Moon"] = "j_to_the_moon",
	["Stone Joker"] = "j_stone",
	["Lucky Cat"] = "j_lucky_cat",
	["Bull"] = "j_bull",
	["Diet Cola"] = "j_diet_cola",
	["Trading Card"] = "j_trading",
	["Flash Card"] = "j_flash",
	["Spare Trousers"] = "j_trousers",
	["Ramen"] = "j_ramen",
	["Seltzer"] = "j_selzer",
	["Castle"] = "j_castle",
	["Mr. Bones"] = "j_mr_bones",
	["Acrobat"] = "j_acrobat",
	["Sock and Buskin"] = "j_sock_and_buskin",
	["Troubadour"] = "j_troubadour",
	["Certificate"] = "j_certificate",
	["Smeared Joker"] = "j_smeared",
	["Throwback"] = "j_throwback",
	["Rough Gem"] = "j_rough_gem",
	["Bloodstone"] = "j_bloodstone",
	["Arrowhead"] = "j_arrowhead",
	["Onyx Agate"] = "j_onyx_agate",
	["Glass Joker"] = "j_glass",
	["Showman"] = "j_ring_master",
	["Flower Pot"] = "j_flower_pot",
	["Merry Andy"] = "j_merry_andy",
	["Oops! All 6s"] = "j_oops",
	["The Idol"] = "j_idol",
	["Seeing Double"] = "j_seeing_double",
	["Matador"] = "j_matador",
	["Satellite"] = "j_satellite",
	["Cartomancer"] = "j_cartomancer",
	["Astronomer"] = "j_astronomer",
	["Bootstraps"] = "j_bootstraps",
}

local spf_keys = { "500", "750", "1000" }

local voucher_keys = {
  "None",
  "Overstock",
  "Clearance Sale",
  "Hone",
  "Reroll Surplus",
  "Crystal Ball",
  "Telescope",
  "Grabber",
  "Wasteful",
  "Tarot Merchant",
  "Planet Merchant",
  "Seed Money",
  "Blank",
  "Magic Trick",
  "Hieroglyph",
  "Director's Cut",
  "Paint Brush",
}

local tag_keys = {
  "None",
  "Charm Tag",
  "Double Tag",
  "Uncommon Tag",
  "Rare Tag",
  "Holographic Tag",
  "Foil Tag",
  "Polychrome Tag",
  "Investment Tag",
  "Voucher Tag",
  "Boss Tag",
  "Juggle Tag",
  "Coupon Tag",
  "Economy Tag",
  "Skip Tag",
  "D6 Tag",
}

local pack_keys = {
  "None",
  "Normal Arcana",
  "Jumbo Arcana",
  "Mega Arcana",
  "Normal Celestial",
  "Jumbo Celestial",
  "Mega Celestial",
  "Normal Standard",
  "Jumbo Standard",
  "Mega Standard",
  "Normal Buffoon",
  "Jumbo Buffoon",
  "Mega Buffoon",
  "Normal Spectral",
  "Jumbo Spectral",
  "Mega Spectral",
}
local rare_joker_keys = {
  "None",
  "DNA",
  "Vagabond",
  "Baron",
  "Obelisk",
  "Baseball Card",
  "Ancient Joker",
  "Campfire",
  "Blueprint",
  "Wee Joker",
  "Hit the Road",
  "The Duo",
  "The Trio",
  "The Family",
  "The Order",
  "The Tribe",
  "Stuntman",
  "Invisible Joker",
  "Brainstorm",
  "Driver's License",
  "Burnt Joker",
}
local uncommon_joker_keys = {
  "None",
  "Joker Stencil",
  "Four Fingers",
  "Mime",
  "Ceremonial Dagger",
  "Marble Joker",
  "Loyalty Card",
  "Dusk",
  "Fibonacci",
  "Steel Joker",
  "Hack",
  "Pareidolia",
  "Space Joker",
  "Burglar",
  "Blackboard",
  "Sixth Sense",
  "Constellation",
  "Hiker",
  "Card Sharp",
  "Madness",
  "Seance",
  "Vampire",
  "Shortcut",
  "Hologram",
  "Cloud 9",
  "Rocket",
  "Midas Mask",
  "Luchador",
  "Gift Card",
  "Turtle Bean",
  "Erosion",
  "To the Moon",
  "Stone Joker",
  "Lucky Cat",
  "Bull",
  "Diet Cola",
  "Trading Card",
  "Flash Card",
  "Spare Trousers",
  "Ramen",
  "Seltzer",
  "Castle",
  "Mr. Bones",
  "Acrobat",
  "Sock and Buskin",
  "Troubadour",
  "Certificate",
  "Smeared Joker",
  "Throwback",
  "Rough Gem",
  "Bloodstone",
  "Arrowhead",
  "Onyx Agate",
  "Glass Joker",
  "Showman",
  "Flower Pot",
  "Merry Andy",
  "Oops! All 6s",
  "The Idol",
  "Seeing Double",
  "Matador",
  "Satellite",
  "Cartomancer",
  "Astronomer",
  "Bootstraps",
}


G.FUNCS.change_target_voucher = function(x)
  Brainstorm.config.ar_filters.voucher_id = x.to_key
  Brainstorm.config.ar_filters.voucher_name = voucher_list[x.to_val]
  Brainstorm.writeConfig()
end

G.FUNCS.change_target_pack = function(x)
  Brainstorm.config.ar_filters.pack_id = x.to_key
  Brainstorm.config.ar_filters.pack = pack_list[x.to_val]
  Brainstorm.writeConfig()
end

G.FUNCS.change_target_tag = function(x)
  Brainstorm.config.ar_filters.tag_id = x.to_key
  Brainstorm.config.ar_filters.tag_name = tag_list[x.to_val]
  Brainstorm.writeConfig()
end

G.FUNCS.change_target_rare_joker = function(x)
  Brainstorm.config.ar_filters.rare_joker_id = x.to_key
  Brainstorm.config.ar_filters.rare_joker_name = rare_joker_list[x.to_val]
  Brainstorm.writeConfig()
end

G.FUNCS.change_target_uncommon_joker = function(x)
  Brainstorm.config.ar_filters.uncommon_joker_id = x.to_key
  Brainstorm.config.ar_filters.uncommon_joker_name = uncommon_joker_list[x.to_val]
  Brainstorm.writeConfig()
end

G.FUNCS.change_soul_count = function(x)
  Brainstorm.config.ar_filters.soul_skip = x.to_val
  Brainstorm.writeConfig()
end

G.FUNCS.change_spf = function(x)
  Brainstorm.config.ar_prefs.spf_id = x.to_key
  Brainstorm.config.ar_prefs.spf_int = spf_list[x.to_val]
  Brainstorm.writeConfig()
end

Brainstorm.opt_ref = G.FUNCS.options
G.FUNCS.options = function(e)
  Brainstorm.opt_ref(e)
end

local ct = create_tabs
function create_tabs(args)
  if args and args.tab_h == 7.05 then
    args.tabs[#args.tabs + 1] = {
      label = "Brainstorm",
      tab_definition_function = function()
        return {
          n = G.UIT.ROOT,
          config = {
            align = "cm",
            padding = 0.05,
            colour = G.C.CLEAR,
          },
          nodes = {
            {
              n = G.UIT.C,
              config = {
                align = "cm",
                padding = 0.05,
                r = 0.1,
                colour = darken(G.C.UI.TRANSPARENT_DARK, 0.25),
              },
              nodes = {
                create_option_cycle({
                  label = "AR: TAG SEARCH",
                  scale = 0.8,
                  w = 4,
                  options = tag_keys,
                  opt_callback = "change_target_tag",
                  current_option = Brainstorm.config.ar_filters.tag_id or 1,
                }),
                create_option_cycle({
                  label = "AR: VOUCHER SEARCH",
                  scale = 0.8,
                  w = 4,
                  options = voucher_keys,
                  opt_callback = "change_target_voucher",
                  current_option = Brainstorm.config.ar_filters.voucher_id or 1,
                }),
                create_option_cycle({
                  label = "AR: PACK SEARCH",
                  scale = 0.8,
                  w = 4,
                  options = pack_keys,
                  opt_callback = "change_target_pack",
                  current_option = Brainstorm.config.ar_filters.pack_id or 1,
                }),
                create_option_cycle({
                  label = "AR: N. SOULS",
                  scale = 0.8,
                  w = 4,
                  options = { 0, 1 },
                  opt_callback = "change_soul_count",
                  current_option = Brainstorm.config.ar_filters.soul_skip + 1
                    or 1,
                }),
              },
            },
            {
              n = G.UIT.C,
              config = {
                align = "cm",
                padding = 0.05,
                r = 0.1,
                colour = darken(G.C.UI.TRANSPARENT_DARK, 0.25),
              },
              nodes = {
                create_option_cycle({
                  label = "AR: First Rare Joker",
                  scale = 0.8,
                  w = 4,
                  options = rare_joker_keys,
                  opt_callback = "change_target_rare_joker",
                  current_option = Brainstorm.config.ar_filters.rare_joker_id or 1,
                }),
                create_option_cycle({
                  label = "AR: First Uncommon Joker",
                  scale = 0.8,
                  w = 4,
                  options = uncommon_joker_keys,
                  opt_callback = "change_target_uncommon_joker",
                  current_option = Brainstorm.config.ar_filters.uncommon_joker_id or 1,
                }),
                create_option_cycle({
                  label = "AP: Seeds per frame",
                  scale = 0.8,
                  w = 4,
                  options = spf_keys,
                  opt_callback = "change_spf",
                  current_option = Brainstorm.config.ar_prefs.spf_id or 1,
                }),
                create_toggle({
                  label = "AR: INST OBSERVATORY",
                  scale = 0.8,
                  ref_table = Brainstorm.config.ar_filters,
                  ref_value = "inst_observatory",
                  callback = function(_set_toggle) end,
                }),
                create_toggle({
                  label = "AR: INST PERKEO",
                  scale = 0.8,
                  ref_table = Brainstorm.config.ar_filters,
                  ref_value = "inst_perkeo",
                  callback = function(_set_toggle) end,
                }),
                create_toggle({
                  label = "AR: Negative tag ante 5-8",
                  scale = 0.8,
                  ref_table = Brainstorm.config.ar_filters,
                  ref_value = "negative_5to8",
                  callback = function(_set_toggle) end,
                }),
              },
            },
          },
        }
      end,
      tab_definition_function_args = "Brainstorm",
    }
  end
  return ct(args)
end
