import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ['input']
  connect(){
    this.player = 0
  }

  closeModal(e){
    e.currentTarget.classList.remove("modal-opened");
  }

  setPlayer(e){
    this.player = e.currentTarget.dataset.player
  }

  setRoster(e){
    var roster = e.currentTarget.dataset.roster
    var path = "/rosters/" + roster + "/add_player/" + this.player
    
    $.ajax({
      method: "POST",
      url: path
    })
  }
}