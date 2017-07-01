class ChangeDgmExpressions < ActiveRecord::Migration[5.1]
  def change
    rename_table :dgmExpressions, :dogma_expressions
    change_table :dogma_expressions do |t|
      t.rename :expressionID, :expression_id
      t.rename :operandID, :operand_id
      t.rename :expressionValue, :value
      t.rename :expressionName, :name
      t.rename :expressionTypeID, :type_id
      t.index :type_id
      t.rename :expressionGroupID, :item_group_id
      t.index :item_group_id
      t.rename :expressionAttributeID, :attribute_id
      t.index :attribute_id
    end
    change_table :dogma_effects do |t|
      t.index :pre_expression
      t.index :post_expression
    end
    add_foreign_key :dogma_effects, :dogma_expressions, column: :pre_expression,
                                                        primary_key: :expression_id
    add_foreign_key :dogma_effects, :dogma_expressions, column: :post_expression,
                                                        primary_key: :expression_id
  end
end
