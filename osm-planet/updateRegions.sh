#!/bin/bash
BASE=/var/lib/jenkins/osm-planet/regions

updateRegion() {
	echo "Update ${1} using ${2}"
	if 
    osmupdate ${BASE}/${1}.o5m ${BASE}/current-update.o5m -B=misc/osm-planet/polygons${2} -v
    osmconvert --out-pbf ${BASE}/${1}.o5m > ${BASE}/${1}.osm.pbf
    # mv -f ${1} ${1}.old || true
    rm ${BASE}/${1}
    mv ${BASE}/current-update.o5m ${BASE}/${1}
}

rm current-update.o5m || true
updateRegion Russia-sankt-petersburg russia-regions/sankt-peterburg.poly
updateRegion Russia-moscow russia-regions/moscow.poly

ls -larh ${BASE}


