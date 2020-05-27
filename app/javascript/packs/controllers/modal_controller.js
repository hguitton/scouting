import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["modalWindow"];

  open(event) {
    this.modal(event).classList.add("modal-opened");
  }

  close(event) {
    this.modal(event).classList.remove("modal-opened");
  }

  modal(event) {    
    if (event.currentTarget.dataset.selector){
      console.log(event.currentTarget.dataset.selector);
      console.log(document.getElementById(event.currentTarget.dataset.selector));
      
      return document.getElementById(event.currentTarget.dataset.selector);
    }
    return this.modalWindowTarget;
  }
}
