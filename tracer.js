$(document).ready(function() {
	$("a").click(function() {
		var href= this.href;
	    var URLs = "tracer.aspx?href="+href;

        $.ajax({
            url: URLs,
            type:"GET",
            dataType:'text',

            success: function(msg){
                //alert(msg);
            }
        });
            

	  
	});
});
 

