crumb :companies do
  link "Companies", root_path
end

crumb :company do |company|
  link company.name, company_path(company)
  parent :companies
end
