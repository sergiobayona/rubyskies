// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

window.initAutocomplete = () => {
    const event = new Event("initAutocomplete")
    event.initEvent("places-loaded", true, true)
    window.dispatchEvent(event)
}

