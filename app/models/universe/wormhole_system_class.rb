class WormholeSystemClass < ApplicationRecord
  self.primary_key = 'system_id'
  
  enum class: { class_1:     1,
                class_2:     2,
                class_3:     3,
                class_4:     4,
                class_5:     5,
                class_6:     6,
                highsec:     7,
                lowsec:      8,
                nullsec:     9,
                ovfs_g:     10,
                b_hlog:     11,
                thera:      12,
                small_ship: 13,
                sentinel:   14,
                barbican:   15,
                vidette:    16,
                conflux:    17,
                redoubt:    18 }
  
  belongs_to :class_wormhole, polymorphic: true
end
