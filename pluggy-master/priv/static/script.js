if (top.location.pathname == "/") {
    $(".create #create, .create #join").hide();
    $(".create").on( "mouseenter",function() {
        $(".create #create, .create #join").show();
        $(".create #add").hide();
    });
    $(".create").on( "mouseleave",function() {
        $(".create #create, .create #join").hide();
        $(".create #add").show();
    });
    $(".create #create").click(function() {
        top.location.pathname = "/create/w"
    });
    $(".create #join").click(function() {
        top.location.pathname = "/join/w"
    });
};