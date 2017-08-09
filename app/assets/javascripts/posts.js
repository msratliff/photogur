$(function() {

	var currentPage = 2

	if ($('.pagination .next_page') && ('.pagination .next_page').length) {
		$(window).scroll(function() {
		    		    
			var url = $('.pagination .next_page')[0].href;
		    

			    if (url && $(window).scrollTop() > ($(document).height() - $(window).height())-10 ) {
			        // alert("near bottom");
			                // ajax call get data from server and append to the div
			        
			        $('.pagination').hide();
			        
			        // $('#infinite-scrolling').append("Fetching...");
			        // $.getScript(url);

			        $.ajax({
			        	url: url,
			        	contentType: 'application/json',
			        	type: 'GET',
			        	data: {
			        		page: currentPage
			        	}
			        }).done(function(data){
			        	var images = $(data).find('.images-grid');
			        	$('.images').append(images)

			        });
			        currentPage++;
			    };


			});
		
		// $(window).scroll();
	};
});
