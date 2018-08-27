class AddInvitedToParticipants < ActiveRecord::Migration[5.2]
  def change
    add_column :participants, :invited, :boolean
  end
end
