#import OSMPythonTools using pip
from OSMPythonTools.nominatim import Nominatim # type: ignore
from OSMPythonTools.overpass import Overpass # type: ignore
from OSMPythonTools.overpass import overpassQueryBuilder
import pandas as pd

#OSM Objects 
nominatim = Nominatim()
overpass = Overpass()

#Get Cafe information in a Dictionary
nyc = nominatim.query("New York City")
query = overpassQueryBuilder(area=nyc, elementType='node', selector='"amenity"="cafe"', out='body')
cafesDictionary = overpass.query(query).toJSON()
cafes = cafesDictionary['elements']

#Convert Dict to DataFrame
df = pd.DataFrame(cafes)
tags = df['tags']  
tagsDf = pd.DataFrame(list(tags))

#Drop Unncessary columns
df.drop(['tags','type'], axis=1, inplace=True)
tagsDf.drop(['internet_access', 'internet_access:fee', 'outdoor_seating','shop','payment:cashapp', 'payment:google_pay', 'payment:account_cards',
       'service:bicycle:stand', 'service:bicycle:tools', 'opening_date','smoking', 'toilets:wheelchair', 'wheelchair',
       'contact:tiktok','delivery:partner', 'name:signed','florist', 'pets', 'cutting','stroller', 'payment:coins', 'payment:notes','mobile',
       'payment:telephone_cards', 'cityracks.housenum', 'cityracks.installed', 'cityracks.large', 'cityracks.rackid', 
       'cityracks.small', 'cityracks.street','takeaway', 'air_conditioning', 'check_date', 'contact:facebook','cannabis', 'bicycle_parking', 'construction:amenity', 
       'lgbtq', 'open_date', 'indoor', 'level:ref','drink:ché', 'brand:website', 'subject:wikidata', 'building', 'height', 'nycdoitt:bin', 
       'drink:cappuccino', 'toilets:handwashing','contact:email', 'contact:phone', 'diet:non-vegetarian', 'wheelchair:description', 'payment:app', 
       'payment:cards', 'dish', 'wikidata', 'wikipedia', 'highchair', 'brand:en', 'brand:zh', 'int_name', 'name:en', 'name:zh', 'leisure', 'description',
         'name:he', 'payment:jcb', 'drink:matcha', 'catering', 'healthcare', 'contact:twitter', 'diet:kosher', 'diet:halal', 'name:de', 'addr:floor', 'brand:ja', 'name:ja',
           'walkup_window', 'craft', 'capacity:seats', 'not:brand:wikidata', 'drink:kombucha', 'opening_hours:signed', 'facebook', 'start_date', 'tourism', 'disused:amenity', 'payment:apple_pay', 
           'cannabis:cbd', 'books', 'religion', 'payment:electronic_purses', 'drink:filter_coffee', 'delivery:fee', 'delivery:min_payment', 'diet:chicken', 'diet:healthy', 
           'diet:local', 'diet:mediterranean', 'diet:organic', 'diet:pescetarian', 'diet:raw', 'organic', 'fixme:atp', 'layer','payment:credit_cards', 'payment:debit_cards', 'survey:date', 
           'website:menu', 'addr:country', 'check_date:opening_hours', 'diet:vegan', 'drink:soy_milk', 'addr:unit', 'level', 'toilets', 'toilets:access', 'drink:wine', 'contact:website', 'payment:cash', 
           'payment:contactless', 'indoor_seating', 'delivery', 'drink:juice', 'drink:smoothie', 'fax', 'bar', 'diet:dairy_free', 'diet:gluten_free', 'diet:vegetarian', 'payment:american_express', 'payment:discover_card', 
           'payment:mastercard', 'payment:visa', 'reservation', 'opening_hours:kitchen', 'toilets:unisex', 'operator', 'operator:type', 'operator:website', 'alt_name', 'drink:beer', 
           'old:website', 'female', 'male', 'entrance', 'short_name', 'cocktails', 'drink:liquor', 'happy_hours', 'designation', 'wifi', 'drive_through', 'atm', 'internet_access:password', 
           'internet_access:ssid', 'diet:meat', 'diet:nut_free', 'check_date:diet:vegetarian', 'source', 'drink', 'opening_hours:covid19', 'cost:coffee', 'old_name','removed:name', 'disused:shop',
            'bakery', 'airside', 'disused', 'sport', 'payment:diners_club', 'payment:unionpay', 'motorcycle:clothes', 'motorcycle:theme', 'ele', 'addr:suburb', 'black_owned', 'dog', 'drink:cocktail', 'name:pt', 
            'brewery', 'brand:ko', 'name:ko', 'name:ru', 'name:it', 'addr:county', 'internet', 'fireplace', 'contact:pinterest', 'toilets:number', 'amenity_1', 'drink:sake', 'contact:yelp', 'live_music', 'contact:sms',
            'seats', 'min_age', 'toilets:disposal', 'toilets:position', 'payment:NFC_mobile_payments', 'disused:website','diet:lactose_free', 'drink:sangria', 'drink:cold_brew_coffee', 'theme', 'mobile_phone:repair', 'food',
            'payment:qr_code', 'fixme', 'opening_hours:cafe','drink:coffee', 'drink:espresso', 'drink:tea', 'opening_hours','internet_access:wlan', 'note', 'payment:gift_card', 'access','website', 'branch', 'brand',
            'brand:wikidata', 'official_name','drink:bubble_tea','board_games','breakfast', 'lunch','studio','ref','coffee','club','cuisine','amenity','cafe'], axis=1, inplace=True)


#Concat DF's -> to CSV
df = pd.concat([df,tagsDf], axis=1)
df.to_csv('cafe_data.csv')
























