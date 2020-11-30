class ClinicCollection

  def initialize(clinic, genre_ids, consultation_hours)
    @clinic = clinic
    @genre_ids = genre_ids
    @consultation_hours = consultation_hours
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

    @consultation_hours.each do |consultation_hour|
      consultation_hour.save
    end
    
    # @clinic = Clinic.create(clinic_params)
    # clinic_params[:genre_ids].each do |genre_id|
    #   genre_map = GenreMap.new(genre_id: genre_id,clinic_id: @clinic.id)
    #   genre_map.save
    # end
  end
end

# class ClinicCollection
#   def initialize
#     @clinic = Clinic.first
#   end

#   def name
#     puts @clinic.name
#   end
# end
