class ClinicCollection

  def initialize(clinic, genre_ids)
    @clinic = clinic
    @genre_ids = genre_ids
  end

  def save!

    # puts 'やっほ-!!'
    # c = Clinic.first
    # puts c.inspect

    @clinic.save
    @genre_ids.each do |genre_id|
      genre_map = GenreMap.new(genre_id, @clinic.id)
      genre_map.save
    end

    # @clinic = Clinic.create(clinic_params)
    # clinic_params[:genre_ids].each do |genre_id|
    #   genre_map = GenreMap.new(genre_id: genre_id,clinic_id: @clinic.id)
    #   genre_map.save
    # end
  end
end
