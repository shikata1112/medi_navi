module LoginModule

  def login_admin(admin)
    visit new_admin_session_path
		fill_in 'admin_email', with: admin.email
		fill_in 'admin_password', with: admin.password
		click_button 'ログイン'
  end

  def login_member(member)
    visit new_member_session_path
		fill_in 'member_email', with: member.email
		fill_in 'member_password', with: member.password
    click_button 'ログイン' 
  end
  
end