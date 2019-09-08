crumb :root do
  link "メルカリ", root_path
end

crumb :mypage do
  link "マイページ", user_path(current_user)
  parent :root
end

crumb :profile do
  link "プロフィール", users_profile_path
  parent :mypage
end

crumb :logout do
  link "ログアウト", users_logout_path
  parent :mypage
end

crumb :identification do
  link "本人情報の登録", users_identification_path
  parent :mypage
end

crumb :card do
  link "支払い方法", users_card_path
  parent :mypage
end

crumb :addCard do
  link "クレジット情報入力", users_addCard_path
  parent :card
end

crumb :items do |item|
  link item.name
  parent :root
end

crumb :exhibiting do
  link "出品した商品 - 出品中"
  parent :mypage
end

crumb :exhibiting_show do
  link "出品商品画面"
  parent :exhibiting
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).