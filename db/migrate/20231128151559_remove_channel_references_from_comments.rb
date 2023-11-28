class RemoveChannelReferencesFromComments < ActiveRecord::Migration[7.1]
  def change
    remove_reference :comments, :channel
  end
end
