module ApplicationHelper

  # 診療時間
  def time_list
    [
      ['07:00', '07:00'],['07:30', '07:30'],['08:00', '08:00'],['08:30', '08:30'],['09:00', '09:00'],
      ['09:30', '09:30'],['10:00', '10:00'],['10:30', '10:30'],['11:00', '11:00'],['11:30', '11:30'],
      ['12:00', '12:00'],['12:30', '12:30'],['13:00', '13:00'],['13:30', '13:30'],['14:00', '14:00'],
      ['14:30', '14:30'],['15:00', '15:00'],['15:30', '15:30'],['16:00', '16:00'],['16:30', '16:30'],
      ['17:00', '17:00'],['17:30', '17:30'],['18:00', '18:00'],['18:30', '18:30'],['19:00', '19:00'],
      ['19:30', '19:30'],['20:00', '20:00'],['20:30', '20:30'],['21:00', '21:00'],['21:30', '21:30'],
      ['22:00', '22:00'],['22:30', '22:30'],['23:00', '23:00'],
    ]
  end

  # 新着順　
  def self.new_order
    self.order(id: 'DESC')
  end

  # 星点数順
  def self.score_order
    self.where(id: Review.group(:clinic_id).order('avg(score) desc').pluck(:clinic_id))
  end

  # レビュー数
  def self.review_order
    self.where(id: Review.group(:clinic_id).order('count(clinic_id) desc').pluck(:clinic_id))
  end

  # 並び替え
  def self.sort(selection, clinics)
    case selection 
    when params[:keyword] == "new"
      clinics.new_order
    when params[:keyword] == "score"
      clinics.score_order
    when params[:keyword] == "review"
      clinics.review_order
    when  params[:keyword] == "------------"
      clinics
    end
  end

end
