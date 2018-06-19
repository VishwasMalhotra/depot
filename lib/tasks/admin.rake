namespace :admin do
  task :set_admin, [:email_identification] => [:environment] do |task, args|
    user = User.find_by_email(args.email_identification)
    user.role = :admin
    user.save!
  end
end


