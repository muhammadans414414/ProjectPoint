# frozen_string_literal: true
# Roles
Role.create(name:'guest')
Role.create(name:'developer')
Role.create(name:'technical lead')
Role.create(name:'engineering manager')
Role.create(name:'director general')
Role.create(name:'admin')

# Technologies

Technology.create(name:'Ruby on Rails')
Technology.create(name:'Php')
Technology.create(name:'Laravel')
Technology.create(name:'Wordpress')
Technology.create(name:'Flutter')
Technology.create(name:'React Native')
Technology.create(name:'Android')
Technology.create(name:'Mern Stack')
Technology.create(name:'Mean Stack')
Technology.create(name:'Blockchain')
Technology.create(name:'Mean Stack')

# Guest
@guest=User.create(email:'guest@vp.com', role_id: Role.where(name:Guest).first.id,password: 'guest@vp', password_confirmation:'guest@vp',technology_id:Technology.where(name:"Ruby on Rails").first.id)
@guest.confirm

# Developer 
@developer=User.create(email:'developer@vp.com', role_id: Role.where(name:Developer).first.id,password: 'developer@vp', password_confirmation:'developer@vp',technology_id:Technology.where(name:"Ruby on Rails").first.id)
@developer.confirm

# Technical Lead
@technical_lead=User.create(email:'technical_lead@vp.com', role_id: Role.where(name:TechnicalLead).first.id,password: 'technical_lead@vp', password_confirmation:'technical_lead@vp',technology_id:Technology.where(name:"Ruby on Rails").first.id)
@technical_lead.confirm

# Engineering Manager
@engineering_manager=User.create(email:'engineering_manager@vp.com', role_id: Role.where(name:EngineeringManager).first.id,password: 'engineering_manager@vp', password_confirmation:'engineering_manager@vp',technology_id:Technology.where(name:"Ruby on Rails").first.id)
@engineering_manager.confirm

# Director General
@director_general=User.create(email:'director_general@vp.com', role_id: Role.where(name:DirectorGeneral).first.id,password: 'director_general@vp', password_confirmation:'director_general@vp',technology_id:Technology.where(name:"Ruby on Rails").first.id)
@director_general.confirm

# Admin
@admin=User.create(email:'admin@vp.com', role_id: Role.where(name:Admin).first.id,password: 'admin@vp', password_confirmation:'admin@vp',technology_id:Technology.where(name:"Ruby on Rails").first.id)
@admin.confirm

# Skills

Skill.create(name:"Project Management")




