import { Controller } from "stimulus"
import sortable from "html5sortable/dist/html5sortable.es"

export default class extends Controller {
  static targets = ['sortable']
  connect(){
    this.list = ""
    this.sortableTargets.forEach(el => {
      this.list += " .sortable-" + el.dataset.id + ","
    });
    this.list = this.list.slice(0,-1)

    sortable('.players-pool',{
      acceptFrom: this.list + ', .players-pool'
    });
    
    sortable(this.list, {
      acceptFrom: this.list + ', .players-pool'
    });

    sortable('.sortable')[0].addEventListener('sortupdate', function(e) {
      console.log(e.detail);
    })
  }
}