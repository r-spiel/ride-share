########################################################
# Step 1: Establish the layers

# In this section of the file, as a series of comments,
# create a list of the layers you identify.
# Which layers are nested in each other?
# Which layers of data "have" within it a different layer?
# Which layers are "next" to each other?

# ~~~~~~LIST: Driver_ID, Date, Cost, Rider_ID, rating
# ~~~~~~I think the Driver ID should hold the dates of their rides, which would then hold the individual data for each ride (cost, rider, rating)
# ~~~~~~Actually Driver_id will a list of each individual ride, date any be included in there {date, cost, rider_id, rating}
# ~~~~~~The things which will be listed (arrays) are the rides.  

########################################################
# Step 2: Assign a data structure to each layer

# Copy your list from above, and in this section
# determine what data structure each layer should have

# driver_data =
#     {driver_id: [{
#                      date: "",
#                      cost: 0,
#                      rider_id: "",
#                      rating: 0
#                  }... #more hashes for each ride
#
#       ],
#     driver_id: [{ride data}, [ride data]...],
#       ...more driver_ids
#   }

########################################################
# Step 3: Make the data structure!

# Setup the entire data structure:
# based off of the notes you have above, create the
# and manually write in data presented in rides.csv
# You should be copying and pasting the literal data
# into this data structure, such as "DR0004"
# and "3rd Feb 2016" and "RD0022"

driver_data = {
    DR0004: [
        {
            date: "3rd Feb 2016",
            cost: 5,
            rider_id: "RD0022",
            rating: 5
        },
        {
            date: "4th Feb 2016",
            cost: 10,
            rider_id: "RD0022",
            rating: 4
        },
        {
            date: "5th Feb 2016",
            cost: 20,
            rider_id: "RD0073",
            rating: 5
        }
        ],
    DR0001: [
        {
            date: "3rd Feb 2016",
            cost: 10,
            rider_id: "RD0003",
            rating: 3
        },
        {
            date: "3rd Feb 2016",
            cost: 30,
            rider_id: "RD0015",
            rating: 4
        },
        {
            date: "5th Feb 2016",
            cost: 45,
            rider_id: "RD0003",
            rating: 2
        }
        ],

    DR0002: [
        {
            date: "3rd Feb 2016",
            cost: 25,
            rider_id: "RD0073",
            rating: 5
        },
        {
            date: "4th Feb 2016",
            cost: 15,
            rider_id: "RD0013",
            rating: 1
        },
        {
            date: "5th Feb 2016",
            cost: 35,
            rider_id: "RD0066",
            rating: 3
        }
        ],
    DR0003: [
        {
            date: "4th Feb 2016",
            cost: 5,
            rider_id: "RD0066",
            rating: 5
        },
        {
            date: "5th Feb 2016",
            cost: 50,
            rider_id: "RD0002",
            rating: 2
        }
        ]
    }

########################################################
# Step 4: Total Driver's Earnings and Number of Rides

# Use an iteration blocks to print the following answers:
# - the number of rides each driver has given
# - the total amount of money each driver has made
# - the average rating for each driver
# - Which driver made the most money?
# - Which driver has the highest average rating?

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#Q1 - the number of rides each driver has given

driver_data.each do |driver_id, array_of_rides| #key is the driver_id, the value is an array of all the ride data
  puts "Driver # #{driver_id}, has given #{array_of_rides.length} rides"
end

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#2  - the total amount of money each driver has made

all_drivers_earnings = {} # Here create a hash for the totals for each driver to be used later to compare

puts ""
driver_data.each do |driver_id, array_with_ea_ride| #the value is an array
    drivers_earnings = 0
    array_with_ea_ride.each do |ea_ride_hash| #runs each on the array of hashes, so each ride {}
          drivers_earnings += ea_ride_hash[:cost]
    end
    puts "Driver #: #{driver_id}, earned $ #{drivers_earnings}"
    all_drivers_earnings[driver_id] = drivers_earnings #assigning driver ID to the key for this hash, and earnings( the sum of the cost of each ride) to the value.  Will use this later for Q #4.
end

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#3 - the average rating for each driver

average_ratings = {} #created this hash to store the average ratings to be use later to find the driver with the highest rating
puts "\nThe average rating for each driver is: "

driver_data.each do |driver_id, array_with_ea_ride|
  drivers_total_ratings = 0

  #instead of this try using .reduce method
  array_with_ea_ride.each do |ea_ride_hash| #runs each on the array of hashes, so each ride {}
    drivers_total_ratings += ea_ride_hash[:rating]
  end

  puts "Driver #: #{driver_id}, has an average rating of: #{drivers_total_ratings/array_with_ea_ride.length.to_f}"
  average_ratings[driver_id] = drivers_total_ratings/array_with_ea_ride.length.to_f
end

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#4 - Which driver made the most money?

highest_earning_driver = all_drivers_earnings.max_by {|driver, earnings| earnings}

puts "\nThe highest earning driver is #{highest_earning_driver[0]}, by earning $#{highest_earning_driver[1]}."

# # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# #5 - Which driver has the highest average rating?

highest_rated = average_ratings.max_by {|key, ratings| ratings}
puts "\nThe highest rated driver is #{highest_rated[0]} with an average rating of #{highest_rated[1]}."
