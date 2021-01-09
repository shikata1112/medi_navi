class CSV
  
  def self.csv_values(members)
    generate do |csv|
      header = %w(ID 氏名 email 登録日)
      csv << header
      members.each do |member|
        values = [member.id, member.name, member.email, member.created_at]
        csv << values
      end
    end
    send_data(csv_data, filename: '会員一覧情報')
  end
end