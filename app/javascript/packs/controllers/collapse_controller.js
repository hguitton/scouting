import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["button", "content"];
  toggle(e) {
    e.preventDefault();
    this.contentTarget.classList.contains('collapse-closed')
    ? this.open(e)
    : this.close(e);
  }
  
  open(e) {
    this.contentTarget.classList.remove('collapse-closed')
    this.contentTarget.classList.add('collapse-opened')
  }
  
  close(e) {
    this.contentTarget.classList.remove('collapse-opened')
    this.contentTarget.classList.add('collapse-closed')
  }

}