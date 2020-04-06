import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["name", "birthdate", "height", "weight", "position", "nationality", "program"]
  
  getInfos(e){
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
      }
    })
  }

  updateFields(infos){
    ["name", "birthdate", "height", "weight", "position", "nationality", "program"].forEach(field => {
      if(field in infos){
        this.targets.find(field).value = infos[field]
      }
    })
  }
}