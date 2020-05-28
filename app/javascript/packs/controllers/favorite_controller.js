import { Controller } from "stimulus"

export default class extends Controller {

  fav(e){
    var path = this.data.get('url');
    var new_path = this.changePath(path)
    $.ajax({
      method: "POST",
      url: path,
      success: () => {
        e.target.classList.add('fas')
        e.target.classList.remove('far')
        e.target.dataset.action = "click->favorite#unfav";
        this.element.classList.add('has-text-warning')
        this.data.set('url', new_path)
      }
    })
  }
  
  unfav(e){
    var path = this.data.get('url');
    var new_path = this.changePath(path)

    $.ajax({
      method: "POST",
      url: path,
      success: () => {
        e.target.classList.add('far')
        e.target.classList.remove('fas')
        e.target.dataset.action = "click->favorite#fav";
        this.element.classList.remove('has-text-warning')
        this.data.set('url', new_path)
      }
    })
  }

  changePath(path){
    return path.includes("remove") ? path.replace("remove", "add") : path.replace("add", "remove")
  }
}