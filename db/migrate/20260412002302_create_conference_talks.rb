class CreateConferenceTalks < ActiveRecord::Migration[7.0]
  def change
    create_table :conference_talks do |t|
      t.string :title
      t.string :speaker
      t.string :time
      t.text :description
      t.text :bio
      # TODO date_and_time (could just be a string)

      t.timestamps
    end
  end
end
