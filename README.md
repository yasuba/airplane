#Airplane!

This is the third-week challenge at Makers Academy:

The challenge is to write software to control the flow of planes at an airport. Planes should start off flying and be able to land, when their status will change to landed. The planes can then take off, but only if the weather is nice. Also, if there are strong winds, planes are not permitted to land or take off. The weather is to be created randomly.

The airport has a limited number of runways, so when they are all full all the planes landed at the aiport must take off. Once the planes are in the air, they must have a flying status.

##Technologies
The goal of this challenge was to practice coding with Ruby, to use doubles while testing and also to create a random weather generator, which I did with the Ruby method sample. Testing was done with RSpec.

##Running the software

    git clone git@github.com:yasuba/airplane.git
    cd airplane
    pry
    require './lib/plane.rb'

Once the plane.rb file has been required, you can create instances of planes and airports, then play around with the various methods such as airport.arrivals(plane)

##Running the tests

    cd airplane
    rspec

