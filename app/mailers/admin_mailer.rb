class AdminMailer < ApplicationMailer
    default from: 'enrollmeberkeley@gmail.com'
   
   def team_list_email(admin)
      @admin = admin
      @url  = 'http://www.gmail.com'
      mail(to: @admin.email, subject: 'Welcome to EnrollMe') do |format|
        format.html
      end
   end
   
   def send_approved_email(team)
      @team = team
      
      @team.users.each do |user|
         @user = user
         @url = 'https://cs-169-dasolyoon.c9users.io'
         mail(to: @user.email, subject: 'Your team has been approved') do |format|
            format.html
         end
      end
   end
   
   def send_disapproved_email(team)
      @team = team
      
      @team.users.each do |user|
         @user = user
         @url = 'https://cs-169-dasolyoon.c9users.io'
         mail(to: @user.email, subject: 'Your team has been disapproved') do |format|
            format.html
         end
      end
   end
   
   def look_at_submission(email)
      mail(to: email, subject: "Teams are awaiting your approval!") 
   end
   
   def self.send_look_at_submission
      if !(Team.where("approved = ? AND submitted = ?", false, true).nil?)
         Admin.all.each do |admin|
            look_at_submission(admin.email).deliver
         end
      end
   end
end
