// console.log("Custom JS loaded");
// Add your custom JavaScript here later
document.addEventListener('DOMContentLoaded', function () {
    var grid = document.querySelector('#project-grid');

    if (grid) {
        // Initialize imagesLoaded
        var imgLoad = imagesLoaded(grid);

        imgLoad.on('always', function () {
            // All images are loaded, now initialize Masonry
            var msnry = new Masonry(grid, {
                itemSelector: '.project-grid-item',
                // columnWidth is not strictly needed if items have explicit widths from Bootstrap cols,
                // but for responsiveness, sometimes a sizer helps or percentPosition.
                // For now, let Masonry infer from the first item with Bootstrap cols.
                percentPosition: true, // Recommended for smoother fluid layouts
                // gutter: 0 // Bootstrap's gx-4 provides horizontal spacing via padding inside columns.
                // If you wanted Masonry to manage inter-item horizontal space, you'd remove gx-4
                // from the row and set a gutter value here (e.g., 10 or 20).
                // For now, rely on Bootstrap's gx-4 column padding for horizontal space.
            });
        });
    }
});