crumb :root do
  link "Home", root_path
end

crumb :issues do
  link "All issues", issues_path
end

crumb :issues do |issue|
  link issue.title, issue
  parent :issues
end