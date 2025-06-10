document.addEventListener('DOMContentLoaded', function () {

    // --- MASONRY INITIALIZATION ---
    const grid = document.querySelector('#project-grid');
    if (grid) {
        const imgLoad = imagesLoaded(grid);
        imgLoad.on('always', function () {
            // Una vez que las imágenes están listas, inicializa Masonry
            const msnry = new Masonry(grid, {
                itemSelector: '.project-grid-item',
                percentPosition: true,
            });
            // Importante: Llama a la función de scroll de nuevo por si Masonry cambió la altura
            syncSidebarScroll();
        });
    }
}