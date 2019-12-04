import 'mapbox-gl/dist/mapbox-gl.css';

import { initMapbox } from '../plugins/init_mapbox';

if (document.querySelector('#map')){
 initMapbox();
}
