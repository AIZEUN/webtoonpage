class CreateWebtoons < ActiveRecord::Migration[5.2]
  def change
    create_table :webtoons do |t|
      t.string :writer
      t.string :webtoon_name
      t.string :gerne

      t.timestamps
    end
  end
end
