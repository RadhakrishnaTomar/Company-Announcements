// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "popper"
import "bootstrap"

document.addEventListener('turbolinks:load', () => {
    document.querySelectorAll('.reply-link').forEach(link => {
      link.addEventListener('click', function(event) {
        event.preventDefault();
        const commentId = this.dataset.commentId;
        const form = document.querySelector(`.reply-form[data-comment-id='${commentId}']`);
        form.style.display = form.style.display === 'none' ? 'block' : 'none';
      });
    });
  });