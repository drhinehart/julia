namespace :places do

  desc "Seed Places and Anchors"
  task :seed_all => :environment do
    Place.destroy_all
    Rake::Task['places:seed_places'].execute
    Rake::Task['places:seed_anchors'].execute
  end

  desc "Seed Places"
  task :seed_places => :environment do
    Place.create!(title: "Zins", address: "227 2nd Ave SE, Cedar Rapids, IA 52401")
    Place.create!(title: "Granite City", address: "4755 1st Ave SE, Cedar Rapids, IA 52403")
    Place.create!(title: "White Star Ale House", address: "305 2nd Ave SE, Cedar Rapids, IA 52401")
    Place.create!(title: "Texas Roadhouse", address: "2605 Edgewood Rd SW, Cedar Rapids, IA 52404")
    Place.create!(title: "Irish Democrat", address: "3207 1st Ave SE, Cedar Rapids, IA 52402")
    Place.create!(title: "Hacienda Las Glorias", address: "715 1st Ave SW, Cedar Rapids, IA 52405")
    Place.create!(title: "The Lost Cuban", address: "209 3rd Street SE, Cedar Rapids, Iowa 52401")
    Place.create!(title: "La Cantina", address: "102 2nd St SE, Cedar Rapids, IA 52401")
    Place.create!(title: "HuHot Mongolian Grill", address: "4444 1st Ave. NE, Cedar Rapids, IA 52402")
    Place.create!(title: "Ting's Red Lantern", address: "540 Boyson Rd NE, Cedar Rapids, IA 52402")
    Place.create!(title: "Sushi House", address: "2665 Edgewood Pkwy SW, Cedar Rapids, IA 52404")
    Place.create!(title: "El Super Burrito", address: "3300 Johnson Ave NW, Cedar Rapids, IA 52405")
    Place.create!(title: "Starlite Room", address: "3300 1st Ave NE, Cedar Rapids, IA 52402")
    Place.create!(title: "Red's Public House", address: "112 2nd St SE, Cedar Rapids, IA")
    Place.create!(title: "Prairie Soup Company", address: "425 Second St. SE, Cedar Rapids, IA 52401")
    Place.create!(title: "Dublin City Pub", address: "415 1st St SE, Cedar Rapids, IA 52401", website: "http://www.dublincitypub.com")
    Place.create!(title: "Brick's", address: "320 2nd Ave SE, Cedar Rapids, IA 52401", website: "http://www.brickscedarrapids.com")
    Place.create!(title: "Jimmy John's", address: "411 3rd St SE, Cedar Rapids, IA 52401")
    Place.create!(title: "Adelita's Mexican", address: "2833 Blairs Ferry Rd NE, Cedar Rapids, IA", website: "http://www.adelitascr.com/")
    Place.create!(title: "Los Compadres", address: "2825 6th St SW, Cedar Rapids, IA 52404")
    Place.create!(title: "Zeppelins", address: "5300 Edgewood Road Northeast, Cedar Rapids, IA")
    Place.create!(title: "Lava", address: "5400 Edgewood Rd NE, Cedar Rapids, IA")
    Place.create!(title: "Parlor City Pub and Eatery", address: "1125 3rd St SE, Cedar Rapids, IA")
    Place.create!(title: "Cibo Fusion", address: "685 Marion Blvd, Marion, IA 52302")
    Place.create!(title: "Third Base Brewing", address: "500 Blairs Ferry Rd NE, Cedar Rapids, IA")
    Place.create!(title: "Buffalo Wild Wings", address: "1100 Blairs Ferry Rd #101, Cedar Rapids, IA")
    Place.create!(title: "Red Robin Burgers", address: "4625 1st Ave. NE, Cedar Rapids, IA 52402")
    Place.create!(title: "Olive Garden", address: "367 Collins Rd NE, Cedar Rapids, IA 52402-3118")
    Place.create!(title: "GreenLeaves", address: "1412 Twixt Town Rd, Cedar Rapids, IA")
    Place.create!(title: "Deb's Ice Cream and Deli", address: "215 3rd St SE, Cedar Rapids, IA 52401-1501")
    Place.create!(title: "Austin Blues BBQ", address: "210 3rd Avenue Southeast, Cedar Rapids, IA 52401")
    Place.create!(title: "Mr Beans", address: "200 1st St SE Cedar Rapids, IA 52401", website: "http://mrbeansrestaurant.com")
    Place.create!(title: "The Coffee Emporium", address: "220 3rd Ave SW, Cedar Rapids, IA 52401", website: "http://www.thecoffeeemporiumcr.com/")
    Place.create!(title: "Pita'z", address: "1057 North Center Point Road, Hiawatha, IA 52233")
    Place.create!(title: "Culver's", address: "1005 North Center Point Road, Hiawatha, IA 52233")
  end

  desc "Seed Anchors"
  task :seed_anchors => :environment do
    Place.create!(title: "United Fire Group", address: "118 2nd Ave SE, Cedar Rapids, IA 52401", anchor: 1)
    Place.create!(title: "The Gazette", address: "500 3rd Ave SE, Cedar Rapids, IA 52401", anchor: 1)
    Place.create!(title: "GMTI Cedar Rapids", address: "1007 Longfellow Drive, Hiawatha, IA 52233", anchor: 1)

    Place.create!(title:"Greene Square Park",address: "", latitude:"41.978223", longitude:"-91.663782", anchor: 2)
    Place.create!(title:"Halfway Mark",address: "", latitude:"42.0019336088783,", longitude:"-91.67142932806705", anchor: 2)
  end


end