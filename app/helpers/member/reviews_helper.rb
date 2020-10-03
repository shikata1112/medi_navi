module Member::ReviewsHelper
  def avg(scores)
    (scores.compact.sum(0.0) / scores.compact.size).round(1)
  end
end
