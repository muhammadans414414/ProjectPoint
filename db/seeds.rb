# # # frozen_string_literal: true
# # # Roles

# ['technical lead','engineering manager','director general'].each do |lead|
#     Lead.create(name:lead)
# end


# ['guest','developer','technical lead','engineering manager','director general','admin'].each do |role|
#     Role.create!(name:role)
# end


# # # # # # # Technologies

# ['Ruby on Rails','Php','Laravel','Wordpress','Flutter','React Native','Android','Mern Stack','Mean Stack','Blockchain'].each do |technology|
#     Technology.create(name:technology)
# end

# begin
#     # # Guest
#     @guest=User.create!(email:'guest@vp.com', role_id: Role.where(name:Guest).first.id,password: 'guest@vp', password_confirmation:'guest@vp',technology_id:Technology.where(name:"Ruby on Rails").first.id,lead_id:Lead.first.id)
#     @guest.confirm
# rescue
    
#  end

# begin
#     # # Developer 
#     @developer=User.create!(email:'developer@vp.com', role_id: Role.where(name:Developer).first.id,password: 'developer@vp', password_confirmation:'developer@vp',technology_id:Technology.where(name:"Ruby on Rails").first.id,lead_id:Lead.second.id)
#     @developer.confirm
# rescue
    
# end
# begin
#     # # Technical Lead
#     @technical_lead=User.create!(email:'technical_lead@vp.com', role_id: Role.where(name:TechnicalLead).first.id,password: 'technical_lead@vp', password_confirmation:'technical_lead@vp',technology_id:Technology.where(name:"Ruby on Rails").first.id,lead_id:Lead.second.id)
#     @technical_lead.confirm
# rescue
    
# end
# begin
#     # # Engineering Manager
#     @engineering_manager=User.create!(email:'engineering_manager@vp.com', role_id: Role.where(name:EngineeringManager).first.id,password: 'engineering_manager@vp', password_confirmation:'engineering_manager@vp',technology_id:Technology.where(name:"Ruby on Rails").first.id,lead_id:Lead.last.id)
#     @engineering_manager.confirm
# rescue
    
# end
# begin
    
#     # # Director General
#     @director_general=User.create!(email:'director_general@vp.com', role_id: Role.where(name:DirectorGeneral).first.id,password: 'director_general@vp', password_confirmation:'director_general@vp',technology_id:Technology.where(name:"Ruby on Rails").first.id,lead_id:Lead.last.id)
#     @director_general.confirm
# rescue
    
# end
# begin
#     # # Admin
#     @admin=User.create!(email:'admin@vp.com', role_id: Role.where(name:Admin).first.id,password: 'admin@vp', password_confirmation:'admin@vp',technology_id:Technology.where(name:"Ruby on Rails").first.id,lead_id:Lead.last.id)
#     @admin.confirm
# rescue
    
# end

# # # # Skills
# ['Project Management','Server Management','ReactJs','Ruby on Rails'].each do |skill|
#     Skill.create(name:skill)
# end

# # # # # Projects

# Project.create(full_name:"Dengue Tracking System",short_name:"DTS",staging_url:"https://www.hotrails.dev/turbo-rails/turbo-frames-and-turbo-streams",staging_test_username:"test",staging_test_password:"test",staging_database_name:"test",live_url:"https://www.hotrails.dev/turbo-rails/turbo-frames-and-turbo-streams",live_test_username:"test",live_test_password:"test",live_database_name:"test",status:"inactive",ssh_url_ip:"dummp ip")
# Project.create(full_name:"Punjab Job Portal",short_name:"PJP",staging_url:"https://www.hotrails.dev/turbo-rails/turbo-frames-and-turbo-streams",staging_test_username:"test",staging_test_password:"test",staging_database_name:"test",live_url:"https://www.hotrails.dev/turbo-rails/turbo-frames-and-turbo-streams",live_test_username:"test",live_test_password:"test",live_database_name:"test",status:"active",ssh_url_ip:"dummp ip")
# Project.create(full_name:"Railway Management System",short_name:"RMS",staging_url:"https://www.hotrails.dev/turbo-rails/turbo-frames-and-turbo-streams",staging_test_username:"test",staging_test_password:"test",staging_database_name:"test",live_url:"https://www.hotrails.dev/turbo-rails/turbo-frames-and-turbo-streams",live_test_username:"test",live_test_password:"test",live_database_name:"test",status:"active",ssh_url_ip:"dummp ip")
# Project.create(full_name:"Electronic Challan System",short_name:"ECS",staging_url:"https://www.hotrails.dev/turbo-rails/turbo-frames-and-turbo-streams",staging_test_username:"test",staging_test_password:"test",staging_database_name:"test",live_url:"https://www.hotrails.dev/turbo-rails/turbo-frames-and-turbo-streams",live_test_username:"test",live_test_password:"test",live_database_name:"test",status:"inactive",ssh_url_ip:"dummp ip")


# # # Skills Assigning to Developers
# UserSkill.create(user_id:User.joins(:role).where("role_id=?",Role.where(name:Developer).first.id).first.id,skill_id:4,level:1)
# UserSkill.create(user_id:User.joins(:role).where("role_id=?",Role.where(name:TechnicalLead).first.id).first.id,skill_id:3,level:2)
# UserSkill.create(user_id:User.joins(:role).where("role_id=?",Role.where(name:EngineeringManager).first.id).first.id,skill_id:2,level:2)
# UserSkill.create(user_id:User.joins(:role).where("role_id=?",Role.where(name:DirectorGeneral).first.id).first.id,skill_id:2,level:2)
# # # Assigning Projects to Developer
# begin
#     UserProject.create!(user_id:User.joins(:role).where("roles.name =?",Developer).first.id, project_id:Project.first.id)
# rescue

# end

