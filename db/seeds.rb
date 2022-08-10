# frozen_string_literal: true
# uncomment following code for one time only when cloning this app
# Role.create(name:"admin")
# Role.create(name:"developer")
User.create(email:"muhammad.ans@pitb.gov.pk", role_id: Role.where(name:Admin).first.id,password: 12345678, password_confirmation:12345678)
