if(window.location.href.indexOf("__internal_do_not_track") != -1) {
  document.cookie = "__internal_do_not_track=true; expires=31 Oct 2017 18:17:28 GMT";
}

if(document.cookie.indexOf("__internal_do_not_track") == -1) {
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-34358956-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();
}
