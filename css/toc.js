toc = $("ul#toc");
$("#content").find("h2").each(function() {
  h = $(this);
  if (h.children('a').attr('href')) {
  		toc.append("<li><a href='" + h.children('a').attr('href') + "'>" + h.text() + "</a></li>");
    } else if (h.attr('id')) {
    	toc.append("<li><a href='#" + h.attr('id') + "'>" + h.text() + "</a></li>");
    }
  
});


/*
$('#nav').affix({
    offset: $('#nav').position()
});
*/