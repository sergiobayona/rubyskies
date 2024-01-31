import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ 
    "form",
    "input", 
    "address_line_1",
    "address_line_2",
    "city",
    "state",
    "postal_code",
    "country"
  ]
  
  connect() {
    this.inputTarget.focus();
    this.hasPlaceSelected = false;
    if(window.google) {
      this.initPlaces();
    }
  }

  preventSubmit(event) {
    if (!this.hasPlaceSelected) {
      event.preventDefault();
    }
  }

  initPlaces() {
    this.autocomplete = new google.maps.places.Autocomplete(this.inputTarget, { 
      componentREstrictions: { country: ['us', 'ca'] },
      fields: ["address_components", "geometry", "icon", "name"],
      types: ['address'] 
    });
    this.autocomplete.addListener("place_changed", this.placeSelected.bind(this))
  }

  placeSelected(event) {
    const place = this.autocomplete.getPlace()

    for (const component of place.address_components) {
      const componentType = component.types[0];
  
      switch (componentType) {
        case "street_number": {
          this.address_line_1Target.value = `${component.long_name} `;
          break;
        }

        case "route": {
          this.address_line_1Target.value += component.short_name;
        }
  
        case "postal_code": {
          this.postal_codeTarget.value = component.long_name;
          break;
        }
  
        case "locality":
          this.cityTarget.value = component.long_name;
          break;
        case "administrative_area_level_1": {
          this.stateTarget.value = component.short_name;
          break;
        }
        case "country":
          this.countryTarget.value = component.long_name;
          break;
      }
    }
    this.hasPlaceSelected = true;
  }
}
