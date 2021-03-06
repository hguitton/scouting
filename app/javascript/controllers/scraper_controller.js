import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["name", "birthdate", "height", "weight", "position", "nationality", "college", "photo", "agent"]

  getInfos(e){
    this.spinner = e.currentTarget.parentNode
    this.spinner.classList.add('is-loading')
    e.Handled = true;
    const link = e.currentTarget.value;
    $.ajax({
      method: "POST",
      url: "/resources/informations",
      data: {
        url: link
      },
      success: (response) => {
        this.updateFields(response["infos"])
        document.dispatchEvent(new CustomEvent("informationsChange"));
        this.spinner.classList.remove('is-loading')
        e.target.classList.add('is-success')
        setTimeout(() => { e.target.classList.remove('is-success')}, 2000);
      },
      error: () => {
        this.spinner.classList.remove('is-loading')
        e.target.classList.add('is-danger')
        setTimeout(() => { e.target.classList.remove('is-danger')}, 2000);
      }
    })
  }

  updateFields(infos){   
    ["name", "birthdate", "height", "weight", "position", "nationality", "college", "photo", "agent"].forEach(field => {
      if(field in infos){
        this.targets.find(field).value = infos[field]
      }
    });
    const base = "player[seasons_attributes][0][";
    ["name", "country", "team", "min", "points", "fgp", "three_fgp", "orb", "drb", "trb", "ast", "blk", "stl"].forEach(field => {
      if(field in infos["stats"]){
        document.getElementsByName(base + field + "]")[0].value = infos["stats"][field]
      }
    })
  }
}