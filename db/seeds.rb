# frozen_string_literal: true
# uncomment following code for one time only when cloning this app
# Role.create(name:'guest')
# Role.create(name:'developer')
# Role.create(name:'technical lead')
# Role.create(name:'engineering manager')
# Role.create(name:'director general')
# Role.create(name:'admin')

# Guest
@guest=User.create(email:'guest@vp.com', role_id: Role.where(name:Guest).first.id,password: 'guest@vp', password_confirmation:'guest@vp')
@guest.confirm

# Developer 
@developer=User.create(email:'developer@vp.com', role_id: Role.where(name:Developer).first.id,password: 'developer@vp', password_confirmation:'developer@vp')
@developer.confirm

# Technical Lead
@technical_lead=User.create(email:'technical_lead@vp.com', role_id: Role.where(name:TechnicalLead).first.id,password: 'technical_lead@vp', password_confirmation:'technical_lead@vp')
@technical_lead.confirm

# Engineering Manager
@engineering_manager=User.create(email:'engineering_manager@vp.com', role_id: Role.where(name:EngineeringManager).first.id,password: 'engineering_manager@vp', password_confirmation:'engineering_manager@vp')
@engineering_manager.confirm

# Director General
@director_general=User.create(email:'director_general@vp.com', role_id: Role.where(name:DirectorGeneral).first.id,password: 'director_general@vp', password_confirmation:'director_general@vp')
@director_general.confirm

# Admin
@admin=User.create(email:'admin@vp.com', role_id: Role.where(name:Admin).first.id,password: 'admin@vp', password_confirmation:'admin@vp')
@admin.confirm
