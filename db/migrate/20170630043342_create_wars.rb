class CreateWars < ActiveRecord::Migration[5.1]
  def change
    create_table :wars, id: false do |t|
      t.integer    :war_id,               null: false, index: { unique: true }
      t.integer    :assistance,           null: false, default: 0, index: true
      t.boolean    :mutual,               null: false, default: false
      t.float      :aggressor_isk_score,  null: false, default: 0
      t.float      :defender_isk_score,   null: false, default: 0
      t.integer    :aggressor_ship_score, null: false, default: 0
      t.integer    :defender_ship_score,  null: false, default: 0
      t.datetime   :declared,             null: false
      t.belongs_to :aggressor,            polymorphic: true,
                                          null: false,
                                          index: true
      t.belongs_to :defender,             polymorphic: true,
                                          null: false,
                                          index: true
      t.datetime   :started
      t.datetime   :retracted
      t.datetime   :finished
      
      t.timestamps null: false
    end
  end
end
