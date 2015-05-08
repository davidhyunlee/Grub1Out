class Location < ActiveRecord::Base

    #Automatically geocode will take the data from external default api which is google maps
    # if address is new the n it will start working

geocoded_by :address
after_validation :geocode, :if => :address_changed?
end