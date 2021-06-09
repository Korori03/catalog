var CACHE_NAME = 'houstoncounty-v1';
var urlsToCache = [
 '/',
  '/content/javascripts/kitchen.sink.js',
];

self.addEventListener('install', function(event) {
  event.waitUntil(
	caches.open(CACHE_NAME)
	  .then(function(cache) {
		 
			//console.log('Opened cache');
			return cache.addAll(urlsToCache);
		  
	  })
  );
});

self.addEventListener('fetch', event => {
  if (event.request.method != 'GET') return;
	event.respondWith(async function() {
    const cache = await caches.open(CACHE_NAME);
    const cachedResponse = await cache.match(event.request);

    if (cachedResponse) {
      event.waitUntil(cache.add(event.request));
      return cachedResponse;
    }
    return fetch(event.request);
  }());
});
