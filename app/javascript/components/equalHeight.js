
$( document ).ready(function() {
    var heights = $(".eql-height").map(function() {
        return $(this).height();
    }).get(),

    maxHeight = Math.max.apply(null, heights);
    console.log(heights)
    console.log(maxHeight)
    $(".eql-height").height(maxHeight);
});


$( document ).ready(function() {
    var heights = $(".big-height").map(function() {
        return $(this).height();
    }).get(),

    maxHeight = Math.max.apply(null, heights);

    $(".big-height").height(maxHeight);
});
