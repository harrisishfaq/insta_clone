// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"


// Slider Start
const sliderWrapper = document.querySelector('.slider-wrapper');
let currentPosition = 0;

function slide(direction) {
    const cardWidth = document.querySelector('.card').offsetWidth + 20; // 20px for margin
    if (direction === 'next' && currentPosition > -(cardWidth * 2)) {
        currentPosition -= cardWidth;
    } else if (direction === 'prev' && currentPosition < 0) {
        currentPosition += cardWidth;
    }
    sliderWrapper.style.transform = `translateX(${currentPosition}px)`;
}
// Slider Endimport "trix"

import "trix"
import "@rails/actiontext"
