class AddingUidAndProviderToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :uid, :integer
    add_column :users, :provider, :string  
    add_column :users, :name, :string
    add_column :users, :email, :string 

    User.all.each do |user|
      user.name = user.username
      user.save!
      puts "#{user.name} saved"
    end
  end
end
