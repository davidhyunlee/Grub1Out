# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

city = Yelp.client.search('Los Angeles', {term: 'bestia'})

businesses = Business.create([

    {
        name: city.businesses[0].name,
        address: city.businesses[0].location.address,
        city: city.businesses[0].location.city,
        postal_code: city.businesses[0].location.postal_code,
        state_code: city.businesses[0].location.state_code,
        country_code: city.businesses[0].location.country_code,
        rating: city.businesses[0].rating,
        phone: city.businesses[0].phone
    }

    ])

city = Yelp.client.search('Los Angeles', {term: 'ledlow'})

businesses = Business.create([

    {
        name: city.businesses[0].name,
        address: city.businesses[0].location.address,
        city: city.businesses[0].location.city,
        postal_code: city.businesses[0].location.postal_code,
        state_code: city.businesses[0].location.state_code,
        country_code: city.businesses[0].location.country_code,
        rating: city.businesses[0].rating,
        phone: city.businesses[0].phone
    }

    ])

city = Yelp.client.search('Los Angeles', {term: 'bar ama'})

businesses = Business.create([

    {
        name: city.businesses[0].name,
        address: city.businesses[0].location.address,
        city: city.businesses[0].location.city,
        postal_code: city.businesses[0].location.postal_code,
        state_code: city.businesses[0].location.state_code,
        country_code: city.businesses[0].location.country_code,
        rating: city.businesses[0].rating,
        phone: city.businesses[0].phone
    }

    ])

city = Yelp.client.search('Los Angeles', {term: 'bar mercat'})

businesses = Business.create([

    {
        name: city.businesses[0].name,
        address: city.businesses[0].location.address,
        city: city.businesses[0].location.city,
        postal_code: city.businesses[0].location.postal_code,
        state_code: city.businesses[0].location.state_code,
        country_code: city.businesses[0].location.country_code,
        rating: city.businesses[0].rating,
        phone: city.businesses[0].phone
    }

    ])

city = Yelp.client.search('Los Angeles', {term: 'superba snack bar'})

businesses = Business.create([

    {
        name: city.businesses[0].name,
        address: city.businesses[0].location.address,
        city: city.businesses[0].location.city,
        postal_code: city.businesses[0].location.postal_code,
        state_code: city.businesses[0].location.state_code,
        country_code: city.businesses[0].location.country_code,
        rating: city.businesses[0].rating,
        phone: city.businesses[0].phone
    }

    ])

city = Yelp.client.search('Los Angeles', {term: 'a frame'})

businesses = Business.create([

    {
        name: city.businesses[0].name,
        address: city.businesses[0].location.address,
        city: city.businesses[0].location.city,
        postal_code: city.businesses[0].location.postal_code,
        state_code: city.businesses[0].location.state_code,
        country_code: city.businesses[0].location.country_code,
        rating: city.businesses[0].rating,
        phone: city.businesses[0].phone
    }

    ])

city = Yelp.client.search('Los Angeles', {term: 'the stocking frame'})

businesses = Business.create([

    {
        name: city.businesses[0].name,
        address: city.businesses[0].location.address,
        city: city.businesses[0].location.city,
        postal_code: city.businesses[0].location.postal_code,
        state_code: city.businesses[0].location.state_code,
        country_code: city.businesses[0].location.country_code,
        rating: city.businesses[0].rating,
        phone: city.businesses[0].phone
    }

    ])

city = Yelp.client.search('Los Angeles', {term: 'faith and flower'})

businesses = Business.create([

    {
        name: city.businesses[0].name,
        address: city.businesses[0].location.address,
        city: city.businesses[0].location.city,
        postal_code: city.businesses[0].location.postal_code,
        state_code: city.businesses[0].location.state_code,
        country_code: city.businesses[0].location.country_code,
        rating: city.businesses[0].rating,
        phone: city.businesses[0].phone
    }

    ])

city = Yelp.client.search('Los Angeles', {term: 'ink'})

businesses = Business.create([

    {
        name: city.businesses[0].name,
        address: city.businesses[0].location.address,
        city: city.businesses[0].location.city,
        postal_code: city.businesses[0].location.postal_code,
        state_code: city.businesses[0].location.state_code,
        country_code: city.businesses[0].location.country_code,
        rating: city.businesses[0].rating,
        phone: city.businesses[0].phone
    }

    ])

city = Yelp.client.search('Los Angeles', {term: 'black hogg'})

businesses = Business.create([

    {
        name: city.businesses[0].name,
        address: city.businesses[0].location.address,
        city: city.businesses[0].location.city,
        postal_code: city.businesses[0].location.postal_code,
        state_code: city.businesses[0].location.state_code,
        country_code: city.businesses[0].location.country_code,
        rating: city.businesses[0].rating,
        phone: city.businesses[0].phone
    }

    ])

city = Yelp.client.search('Los Angeles', {term: 'the bazaar'})

businesses = Business.create([

    {
        name: city.businesses[0].name,
        address: city.businesses[0].location.address,
        city: city.businesses[0].location.city,
        postal_code: city.businesses[0].location.postal_code,
        state_code: city.businesses[0].location.state_code,
        country_code: city.businesses[0].location.country_code,
        rating: city.businesses[0].rating,
        phone: city.businesses[0].phone
    }

    ])

