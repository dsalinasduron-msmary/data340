"""
build up GeoJSON
"""
the_geoj = '{"type":"FeatureCollection","features":['

"""
generate tiling
"""
offset = 10
id = 0
for lat in range(-90,90,10):
    for lon in range (-180,180,10):
        id = id + 1
        c1 = [lon,lat + offset]
        c2 = [lon+offset, lat + offset]
        c3 = [lon+offset,lat]
        c4 = [lon,lat]
        feat =\
        '{ "type": "Feature", "id":' + str(id) + ', "geometry": { "type" : "Polygon", "coordinates":[' 
        feat = feat + str([c1,c2,c3,c4,c1]) + ']}},'
        the_geoj = the_geoj + feat
the_geoj = the_geoj[:-1] + "]}" # remove stray extra comma
print(the_geoj)
