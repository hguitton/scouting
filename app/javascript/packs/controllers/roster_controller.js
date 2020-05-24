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
      acceptFrom: this.list + ', .players-pool',
    })
    
    sortable(this.list, {
      acceptFrom: this.list + ', .players-pool',
    });

    sortable('.sortable').forEach(sortableEl =>{
      sortableEl.addEventListener('sortupdate', (e) => {
        var players = this.buildSpotChanged(e.detail.destination.items);
        var path = sortableEl.dataset.url
        this.updateSpot(path, players)
        
        // If the origin isn't pool and not self (change order), update the origin too 
        if(!e.detail.origin.container.classList.contains('players-pool') && sortableEl != e.detail.origin.container){
          var players = this.buildSpotChanged(e.detail.origin.items);
          var path = e.detail.origin.container.dataset.url
          this.updateSpot(path, players)
        }
      })
    })

    // Only update origin when a player is moved to the Pool
    sortable('.players-pool').forEach(sortableEl =>{
      sortableEl.addEventListener('sortupdate', (e) => { 
        var players = this.buildSpotChanged(e.detail.origin.items);
        var path = e.detail.origin.container.dataset.url
        this.updateSpot(path, players)
      });
    })
  }

  buildSpotChanged(items){
    var players = []
    items.forEach((item, i) => {
      players[i]= item.dataset.playerId;
    })
    return players
  }

  updateSpot(path, players){
    $.ajax({
      method: "POST",
      url: path,
      data: {
        players: players
      }
    })
  }

  updateSpotFields(e){
    e.currentTarget.form.submit();
  }
}