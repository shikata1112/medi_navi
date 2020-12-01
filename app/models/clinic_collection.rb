class ClinicCollection

  def initialize(clinic, genre_ids)
    @clinic = clinic
    @genre_ids = genre_ids
  end

  def save!
    @genre_ids.each { |genre_id| @clinic.genre_maps.build(genre_id: genre_id) }
    @clinic.save!
  end

  def update!
    @clinic.genre_maps.destroy_all
    @genre_ids.each { |genre_id| @clinic.genre_maps.build(genre_id: genre_id) }
  end
end
