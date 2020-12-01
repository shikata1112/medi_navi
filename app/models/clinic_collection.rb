class ClinicCollection

  def initialize(clinic, genre_ids)
    @clinic = clinic
    @genre_ids = genre_ids
  end

  def save!
    @genre_ids.each do |genre_id|
      @clinic.genre_maps.build(genre_id: genre_id)
    end
    @clinic.save!
  end
end
