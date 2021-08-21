import 'owl.carousel/dist/assets/owl.carousel.css';
import 'owl.carousel';

const initCarousel = () => {
  $('.owl-carousel').owlCarousel({
    loop: true,
    margin: 5,
    responsive: {
      0: {
        items: 1
      },
      600: {
        items: 2
      },
      1000: {
        items: 4
      }
    },
    // nav: true,
    // navText: ["<i class='fa fa-chevron-left'></i>","<i class='fa fa-chevron-right'></i>"]
  })

};

export { initCarousel };
