class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, null: false, unique: true, comment: 'メールアドレス'
      t.string :password_digest, null: false, comment: 'ハッシュ化したパスワード'
      t.string :username, null: false, unique: true, comment: 'ユーザー名'

      t.timestamps
    end
  end
end
