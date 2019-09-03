# ホーム
crumb :root do
  link "メルカリ", root_path
end

# マイページ
crumb :mypage do
  # ログイン機能が完了後、「'/users/1'」の部分を「user_path(current_user)」に変更する。
  link "マイページ", '/users/1'
  parent :root
end

# プロフィール
crumb :profile do
  link "プロフィール", users_profile_path
  parent :mypage
end

# ログアウト
crumb :logout do
  link "ログアウト", users_logout_path
  parent :mypage
end

# 本人情報
crumb :identification do
  link "本人情報の登録", users_identification_path
  parent :mypage
end

# 支払い方法
crumb :card do
  link "支払い方法", users_card_path
  parent :mypage
end

# クレジット情報
crumb :addCard do
  link "クレジット情報入力", users_addCard_path
  parent :card
end

# アイテム
crumb :items do |item|
  link item.name
  parent :root
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