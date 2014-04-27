class InsertUserInAllArticles < ActiveRecord::Migration
  def self.up
     user = User.find(:first)
     Article.where(:user_id => nil).each do |article|
       article.user = user;
       article.save
     end
 end
end
