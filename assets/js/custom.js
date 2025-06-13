document.addEventListener('DOMContentLoaded', function () {
  // --- MASONRY INITIALIZATION ---
  const grid = document.querySelector('#project-grid');

  if (grid) {
    // Espera a que todas las imágenes de la grilla se carguen
    const imgLoad = imagesLoaded(grid);

    imgLoad.on('always', function () {
      // Una vez que las imágenes están listas, inicializa Masonry
      new Masonry(grid, {
        itemSelector: '.project-grid-item',
        percentPosition: true,
      });
      // La llamada a syncSidebarScroll() ha sido eliminada.
    });
  }
});
