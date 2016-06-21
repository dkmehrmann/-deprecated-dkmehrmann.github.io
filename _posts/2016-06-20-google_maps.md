---
layout: post
date: Jun 20, 2016
title: "Intro to the Google Maps API"
categories: blog
author: Andrew Mehrmann
--- 
I became interested in the Google Maps API shortly before Google Maps came out
with the "Depart At" and "Arrive By" features that take into consideration the
usual traffic on your route at a given time. I was taking frequent trips
[between Chicago and Champaign](https://www.google.com/maps/dir/Champaign,+IL/Ch
icago,+IL/@41.0394976,-89.0580206,8z/data=!3m1!4b1!4m13!4m12!1m5!1m1!1s0x880cd08
dde97691b:0x30f57847b475bfcf!2m2!1d-88.2433829!2d40.1164204!1m5!1m1!1s0x880e2c3c
d0f4cbed:0xafe0a6ad09c0c000!2m2!1d-87.6297982!2d41.8781136) and could never rely
on the estimated time of arrival if I was going to be anywhere near the city
during rush hour. I had some half-baked ideas of how I might better predict
travel time by incorporating the usual traffic, and all of them involved somehow
programatically querying Google Maps driving directions. The Google Maps
Directions API gives this type of interface along with many other useful
features. There are a ton of potential uses and I don't go into any of them in
detail, but I'll walk through the basics of how to connect to the API via Python
and perform some simple operations.

## The API

You'll need an API key to get started, so head to
https://developers.google.com/console and create a project. You'll get to choose
which APIs you activate and so on. If it seems like the questions aren't
pertinent to you, you're probably right. Google's developers seem like they had
more of the front-facing web developers in mind than hobbyists just trying to
fart around. Nonetheless, when you get your key you'll be able to access the
APIs you've activated. If you create your key for one API, you can activate more
later. The ones you'll want for this demo are the
[Directions](https://developers.google.com/maps/documentation/directions/) and
[Places](https://developers.google.com/places/) APIs. 


{% highlight python %}
import googlemaps
from IPython.display import display, HTML, Image
{% endhighlight %}
 
I put my key in a text file so it wouldn't be floating around on the web, but
you may just enter yours right into the Python code as a string. First you need
to get an instance of the Google Maps API Client: 


{% highlight python %}
keyFile = open('googlemaps_key.txt', 'r')
key = keyFile.readline().rstrip()

gm = googlemaps.Client(key=key) # get the client
{% endhighlight %}
 
## Directions

You can use the [directions](https://googlemaps.github.io/google-maps-services-
python/docs/2.4.3/#googlemaps.Client.directions) method to get driving
directions between an origin and a destination. The result will come back as a
single-element list unless you specify `alternatives=True`. 


{% highlight python %}
directions_result = gm.directions("1060 W Addison St, Chicago, IL L",
                                  "333 W 35th St, Chicago, IL",
                                  mode="driving")
{% endhighlight %}


{% highlight python %}
time = directions_result[0]['legs'][0]['duration']['text'].encode()
print "It would take", time, "to drive from Wrigley field to US Cellular Field"
{% endhighlight %}

    It would take 22 mins to drive from Wrigley field to US Cellular Field



{% highlight python %}
directions_result = gm.directions("1060 W Addison St, Chicago, IL L",
                                  "333 W 35th St, Chicago, IL",
                                  mode="driving", 
                                  alternatives=True)
{% endhighlight %}


{% highlight python %}
len(directions_result) # number of alternate routes given
{% endhighlight %}




    2




{% highlight python %}
# get the duration of each alternate route
for route in directions_result:
    print route['legs'][0]['duration']['text'].encode()
{% endhighlight %}

    22 mins
    26 mins

 
There is a lot of information returned by the API and picking through it is an
arduous task. One of the first things you might want to do though is print out
directions from one place to another. Each of the components of the directions
are a "step" in the nomenclature of the API and I've shown one below. 


{% highlight python %}
directions_result[0]['legs'][0]['steps'][0] 
{% endhighlight %}




    {u'distance': {u'text': u'0.7 mi', u'value': 1079},
     u'duration': {u'text': u'3 mins', u'value': 195},
     u'end_location': {u'lat': 41.9486321, u'lng': -87.64345480000001},
     u'html_instructions': u'Head <b>east</b> on <b>W Addison St</b> toward <b>N Sheffield Ave</b><div style="font-size:0.9em">Parts of this road may be closed at certain times or days</div>',
     u'polyline': {u'points': u'_y__Gvi_vOC{BAgF?gBAMA_CAyBCwBAyB?uBAM?kBCyBCwLuB{IkB_I_@aB'},
     u'start_location': {u'lat': 41.9472028, u'lng': -87.6561236},
     u'travel_mode': u'DRIVING'}


 
Lucky for us, they give us instructions in the form of HTML. Before you think
about parsing it out, remember the
[IPython.display](http://jeffskinnerbox.me/notebooks/ipython's-rich-display-
system.html) module. We can actually display these directions as they would look
in a web browser with a little finagling. 


{% highlight python %}
def display_result(result):

    for step in result['legs'][0]['steps']:
        display(HTML(step['html_instructions']))
        display(HTML('<div style="font-size:0.9em">{0}, {1}</div>'\
                     .format(step['distance']['text'],step['duration']['text'] )))
        display(HTML('<hr style="margin:3px">'))
    dur = result['legs'][0]['duration']['text'].encode()
    dis = result['legs'][0]['distance']['text'].encode()
    display(HTML("<b>{0}, {1}</b>".format(dur, dis)))
    
    return None
{% endhighlight %}


{% highlight python %}
display_result(directions_result[0]) # display the first result
{% endhighlight %}


Head <b>east</b> on <b>W Addison St</b> toward <b>N Sheffield Ave</b><div style="font-size:0.9em">Parts of this road may be closed at certain times or days</div>



<div style="font-size:0.9em">0.7 mi, 3 mins</div>



<hr style="margin:3px">



Turn <b>right</b> onto <b>N Lake Shore Dr</b>



<div style="font-size:0.9em">0.6 mi, 2 mins</div>



<hr style="margin:3px">



Slight <b>left</b> to stay on <b>N Lake Shore Dr</b>



<div style="font-size:0.9em">0.1 mi, 1 min</div>



<hr style="margin:3px">



Take the ramp on the <b>left</b> onto <b>US-41 S</b>/<b>N Lake Shore Dr</b>



<div style="font-size:0.9em">6.5 mi, 12 mins</div>



<hr style="margin:3px">



Turn <b>right</b> onto the <b>Interstate 55 S</b> ramp to <b>Saint Louis</b>



<div style="font-size:0.9em">0.4 mi, 1 min</div>



<hr style="margin:3px">



Continue onto <b>I-55 S</b>



<div style="font-size:0.9em">0.7 mi, 1 min</div>



<hr style="margin:3px">



Take exit <b>293B</b> to merge onto <b>I-90 E</b>/<b>I-94 E</b>



<div style="font-size:0.9em">1.2 mi, 2 mins</div>



<hr style="margin:3px">



Take exit <b>55A</b> toward <b>35th St</b>/<b>Illinois College of Optometry</b>



<div style="font-size:0.9em">0.2 mi, 1 min</div>



<hr style="margin:3px">



Merge onto <b>S Wentworth Ave</b>



<div style="font-size:0.9em">322 ft, 1 min</div>



<hr style="margin:3px">



Turn <b>right</b> onto <b>W 35th St</b><div style="font-size:0.9em">Destination will be on the left</div>



<div style="font-size:0.9em">0.1 mi, 1 min</div>



<hr style="margin:3px">



<b>22 mins, 10.4 mi</b>

 
## Places 
 
The Directions API is pretty slick, but up until now we've just given it nicely
formatted addresses. If I want to feed it place names as I think of them (like
"cheesie's by the Belmont stop"), I need a different API called the Places API.
To use the methods below you'll need to activate the Places API before
proceeding if you haven't already. 


{% highlight python %}
gm.places("cheesie's belmont")['results'][0]
{% endhighlight %}




    {u'formatted_address': u'958 W Belmont Ave, Chicago, IL 60657, United States',
     u'geometry': {u'location': {u'lat': 41.9400603, u'lng': -87.65383270000001}},
     u'icon': u'https://maps.gstatic.com/mapfiles/place_api/icons/bar-71.png',
     u'id': u'b8fe3be17980fc4020a84adf2999c6a37b541e13',
     u'name': u"Cheesie's",
     u'opening_hours': {u'open_now': True, u'weekday_text': []},
     u'photos': [{u'height': 2992,
       u'html_attributions': [u'<a href="https://maps.google.com/maps/contrib/110578698317383538307/photos">Mike Martens</a>'],
       u'photo_reference': u'CoQBdwAAALgJVCrHGHbk9uiL3H9l4Leg494vuOos5R7b_6gcJa0jOW5YT__nCElz6nruVJlLdRfddvx5MUopWPVw7_BOIUkkDvTJfGiKCE5Seb3jCVGfG6uMckZ1cH-aRwuBL47lJmdOMjWGHu3aRzBjWcSEMqCe1z5ypDyyxEQN3jZEd67fEhChGc11-mWDUobwsb339mNoGhTW-uB38Ea86Hr4PeDX1jpQE3AzHw',
       u'width': 4000}],
     u'place_id': u'ChIJ6z5a_KvTD4gRHdSiXi6GRLU',
     u'price_level': 1,
     u'rating': 4.3,
     u'reference': u'CmRdAAAALvjCMgbLcTrqgKPX-CL85ZHhzP4wp562Uy7dkreaueFq9drhCvD-uW62EcfC3R5ceUSCnIRb4nNdl9K9So1dmRIB10APGiIPzhBJBvTh3iSNY1HETQVb-pMLp27dhfSgEhCwIVj6-7gix-8F9bmkW9r8GhS5ay63GUMP3_Rd0Vfc_mQSsnMDPg',
     u'types': [u'bar',
      u'meal_takeaway',
      u'restaurant',
      u'food',
      u'point_of_interest',
      u'establishment']}


 
You can feed the `places` method a text string and it will give you it's best
guess(es) as to which place you are referring. So putting those concepts
together, you can get transit directions between two places via keywords by
chaining the two methods: 


{% highlight python %}
def transit_directions(origin, destination):
    
    place_from = gm.places(origin)['results'][0]['formatted_address']
    place_to = gm.places(destination)['results'][0]['formatted_address']

    directions_result = gm.directions(place_from,
                                      place_to,
                                      mode="transit",
                                      alternatives=True)
    return directions_result
{% endhighlight %}
 
You can even feed it slang or the name of the place much like you could to
Google Maps. 


{% highlight python %}
directions = transit_directions("Wrigley Field", 'merch mart')
{% endhighlight %}
 
Finall pretty print all the options: 


{% highlight python %}
for index, trip in enumerate([x['legs'][0]['duration']['value']/60 for x in directions]):
    display(HTML("<h2>Option #{0}</h2>".format(index+1)))
    display_result(directions[index])
    display(HTML('<hr style="height:3px">'))
{% endhighlight %}


<h2>Option #1</h2>



Walk to Addison (Red)



<div style="font-size:0.9em">0.1 mi, 2 mins</div>



<hr style="margin:3px">



Subway towards 95th



<div style="font-size:0.9em">1.5 mi, 5 mins</div>



<hr style="margin:3px">



Subway towards Loop



<div style="font-size:0.9em">3.2 mi, 11 mins</div>



<hr style="margin:3px">



Walk to 222 W Merchandise Mart Plaza, Chicago, IL 60654, USA



<div style="font-size:0.9em">0.1 mi, 2 mins</div>



<hr style="margin:3px">



<b>30 mins, 5.0 mi</b>



<hr style="height:3px">



<h2>Option #2</h2>



Walk to Addison (Red)



<div style="font-size:0.9em">0.1 mi, 2 mins</div>



<hr style="margin:3px">



Subway towards 95th



<div style="font-size:0.9em">4.7 mi, 14 mins</div>



<hr style="margin:3px">



Walk to 222 W Merchandise Mart Plaza, Chicago, IL 60654, USA



<div style="font-size:0.9em">0.6 mi, 12 mins</div>



<hr style="margin:3px">



<b>28 mins, 5.4 mi</b>



<hr style="height:3px">



<h2>Option #3</h2>



Walk to Belmont (Red/Brown/Purple)



<div style="font-size:0.9em">0.6 mi, 12 mins</div>



<hr style="margin:3px">



Subway towards Loop



<div style="font-size:0.9em">4.2 mi, 15 mins</div>



<hr style="margin:3px">



Walk to 222 W Merchandise Mart Plaza, Chicago, IL 60654, USA



<div style="font-size:0.9em">0.1 mi, 2 mins</div>



<hr style="margin:3px">



<b>29 mins, 4.9 mi</b>



<hr style="height:3px">



<h2>Option #4</h2>



Walk to Addison (Red)



<div style="font-size:0.9em">0.1 mi, 2 mins</div>



<hr style="margin:3px">



Subway towards 95th



<div style="font-size:0.9em">1.5 mi, 5 mins</div>



<hr style="margin:3px">



Subway towards Loop



<div style="font-size:0.9em">3.2 mi, 11 mins</div>



<hr style="margin:3px">



Walk to 222 W Merchandise Mart Plaza, Chicago, IL 60654, USA



<div style="font-size:0.9em">0.1 mi, 2 mins</div>



<hr style="margin:3px">



<b>30 mins, 5.0 mi</b>



<hr style="height:3px">

 
It will also give you detailed information about the type of transit it is
sending you on including the stops, line, and headsign of the mode of transit.
Note these are only returned for transit directions. 


{% highlight python %}
directions[0]['legs'][0]['steps'][1]['transit_details'] #['line']['name'].encode()
{% endhighlight %}




    {u'arrival_stop': {u'location': {u'lat': 41.9250526, u'lng': -87.6528625},
      u'name': u'Fullerton'},
     u'arrival_time': {u'text': u'10:04pm',
      u'time_zone': u'America/Chicago',
      u'value': 1466478240},
     u'departure_stop': {u'location': {u'lat': 41.9474297,
       u'lng': -87.65362549999999},
      u'name': u'Addison (Red)'},
     u'departure_time': {u'text': u'9:59pm',
      u'time_zone': u'America/Chicago',
      u'value': 1466477940},
     u'headsign': u'95th',
     u'line': {u'agencies': [{u'name': u'Chicago Transit Authority',
        u'phone': u'1 888-YOURCTA',
        u'url': u'http://transitchicago.com/'}],
      u'color': u'#c62828',
      u'name': u'Red Line',
      u'text_color': u'#ffffff',
      u'url': u'http://www.transitchicago.com/riding_cta/systemguide/redline.aspx',
      u'vehicle': {u'icon': u'//maps.gstatic.com/mapfiles/transit/iw2/6/us-chicago-subway.png',
       u'name': u'Subway',
       u'type': u'SUBWAY'}},
     u'num_stops': 2}


 
There are a great deal of cool things that a creative mind could do with this
sort of tool. It is possible to add intermediate stops (called waypoints) to
queries as well as create distance matrices between sets of locations. I think
that has a powerful implication for certain types of optimization problems
(routing is one that comes to mind) where it is sometimes necessary to know
travel times between points at certain times of the day or days of the week. As
Google Maps continues to add features and get better at things like predicting
traffic, this API will become even more useful. And in case you just came here
for a picture of a train, you can get that too: 


{% highlight python %}
Image(url="http:" + directions[0]['legs'][0]['steps'][1]['transit_details']['line']['vehicle']['icon'])
{% endhighlight %}




<img src="http://maps.gstatic.com/mapfiles/transit/iw2/6/us-chicago-subway.png"/>


 
[[source code]](https://github.com/dkmehrmann/dkmehrmann.github.io/tree/master/_
ipynb/google_maps.ipynb) 


{% highlight python %}

{% endhighlight %}
