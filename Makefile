# build/gpr_000b11a_e.zip:
# 	mkdir -p $(dir $@)
# 	curl -o $@ http://www12.statcan.gc.ca/census-recensement/2011/geo/bound-limit/files-fichiers/$(notdir $@)

# build/gpr_000b11a_e.shp: build/gpr_000b11a_e.zip
# 	unzip -od $(dir $@) $<
# 	touch $@

# prov.json: build/gpr_000b11a_e.shp
# 	node_modules/.bin/topojson \
# 		-o $@ \
# 		--projection='width = 960, height = 600, d3.geo.albers() \
# 			.rotate([96, 0]) \
# 		    .center([-32, 53.9]) \
# 		    .parallels([20, 60]) \
# 		    .scale(1970) \
# 		    .translate([width / 2, height / 2])' \
# 	    --properties='province=PRENAME' \
# 		--simplify=0.5 \
# 		-- prov=$<

# build/subunits.json: build/Boundaries/CD_2011.shp
# 	ogr2ogr -f GeoJSON  -t_srs "+proj=latlong +datum=WGS84" \
# 	build/subunits.json \
# 	build/Boundaries/CD_2011.shp

	# ogr2ogr -f GeoJSON  -t_srs "+proj=latlong +datum=WGS84" -where "CDNAME IN ('Alberni-Clayoquot')" \
	# -clipdst -125.1550643102 48.8344612907 -126.1800723924 49.2711484127 \
	# build/subunits.json \
	# build/Boundaries/CD_2011.shp

# census.json: build/subunits.json
# 	node_modules/.bin/topojson \
# 		-o $@ \
# 		--projection='width = 960, height = 600, d3.geo.albers() \
# 			.rotate([96, 5]) \
# 		    .center([-32, 58.5]) \
# 		    .parallels([20, 60]) \
# 		    .scale(1970) \
# 		    .translate([width / 2, height / 2])' \
# 	    --properties='zone=CDNAME' \
# 	    --simplify=0.05 \
# 		-- census=$<



# snow basins
build/snowd.json: build/BCGW_78757263_1449272954802_9232/SSL_SSB_SP/SSL_SSB_SP_polygon.shp
	ogr2ogr -f GeoJSON  -t_srs "+proj=latlong +datum=WGS84" \
	build/snowd.json \
	build/BCGW_78757263_1449272954802_9232/SSL_SSB_SP/SSL_SSB_SP_polygon.shp


#working version, not bc albers		
snowdist.json: build/snowd.json
	node_modules/.bin/topojson \
		-o $@ \
		--projection='width = 960, height = 600, d3.geo.albers() \
			.rotate([126, -10]) \
		    .center([7,44]) \
		    .parallels([50, 58]) \
		    .scale(1970) \
		    .translate([width / 2, height / 2])' \
	    --properties='basin=BASIN_NAME' \
	    --properties='basinID=BASIN_ID' \
	    --simplify=0.05 \
		-- snowdist=$<

# snow pillow locations
build/snowp.json: build/BCGW_78757263_1449273107815_7232/SSL_SPL_SV/SSL_SPL_SV_point.shp
	ogr2ogr -f GeoJSON  -t_srs "+proj=latlong +datum=WGS84" \
	build/snowp.json \
	build/BCGW_78757263_1449273107815_7232/SSL_SPL_SV/SSL_SPL_SV_point.shp


#working version, not bc albers		
pillows.json: build/snowp.json
	node_modules/.bin/topojson \
		-o $@ \
		--projection='width = 960, height = 600, d3.geo.albers() \
			.rotate([126, -10]) \
		    .center([7,44]) \
		    .parallels([50, 58]) \
		    .scale(1970) \
		    .translate([width / 2, height / 2])' \
	    --properties='staNam=STATN_NAME' \
	    --properties='locID=SP_LOC_ID' \
	    --simplify=0.05 \
		-- pillows=$<



#bs albers projection - works ###############
# build/sd1.json: build/TA_SD_SVW/TA_SD_SVW_polygon.shp
# 	ogr2ogr -f GeoJSON -t_srs "+proj=aea +lat_1=50 +lat_2=58.5 +lat_0=45 +lon_0=-126 +x_0=1000000 +y_0=0 +ellps=GRS80 +datum=NAD83 +units=m +no_defs  " \
# 	build/sd1.json \
# 	build/TA_SD_SVW/TA_SD_SVW_polygon.shp

# skulldist.json: build/sd1.json
# 	node_modules/.bin/topojson \
# 		--width 960 \
# 	    --height 600 \
# 	    --properties='zone=SD_NAME' \
# 	    --properties='zoneNum=SD_NUM' \
# 	    --simplify=0.05 \
# 		-o $@ \
# 		-- skulldist=$<
###################################



# Use BC Albers Projection
# build/subunits.json: build/Boundaries/CD_2011.shp
# 	ogr2ogr -f GeoJSON  -t_srs "+proj=aea +lat_1=50 +lat_2=58.5 +lat_0=45
# +lon_0=-126 +x_0=1000000 +y_0=0 +ellps=GRS80 +datum=NAD83 +units=m +no_defs" \
# 	build/subunits.json \
# 	build/Boundaries/CD_2011.shp

# census.json: build/subunits.json
# 	node_modules/.bin/topojson \
# 		-o $@ \
# 	    --properties='zone=CDNAME' \
# 		-- census=$<

