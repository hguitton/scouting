import { Controller } from "stimulus"
import "easy-autocomplete"

export default class extends Controller {
  initialize(){
    $(this.element).easyAutocomplete(this.options())
  }

  options() {
    var resource = this.data.get('resource')
    return {
      url: "/resources/" + resource,
      list: {
        sort: {
          enabled: true
        },
        match: {
          enabled: true
        },
        showAnimation: { type: "slide", time: 200, callback: function() {} },    
        hideAnimation: { type: "slide", time: 200, callback: function() {} }
      }
    };
  }
}