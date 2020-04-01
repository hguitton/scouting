import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["heightUs", "heightEu", "weightUs", "weightEu"]

  updateHeightUs(e){
    this.heightUsTarget.value = this.toFeet(parseInt(this.heightEuTarget.value))
  }
  updateHeightEu(e){
    this.heightEuTarget.value = this.toCm(this.heightUsTarget.value)
  }

  updateWeightUs(e){
    this.weightUsTarget.value = this.toLbs(this.weightEuTarget.value)
  }
  updateWeightEu(e){
    this.weightEuTarget.value = this.toKg(this.weightUsTarget.value)
  }

  toFeet(n) {
    var realFeet = ((n * 0.393700) / 12);
    var feet = Math.floor(realFeet);
    var inches = Math.round((realFeet - feet) * 12);
    if(inches && feet) { 
      return feet + "'" + inches + '"'
    }else {
      return ""
    }
  }

  toCm(str) {
    var feet = parseInt(str.split("'")[0]);
    var inches = parseInt(str.split("'")[1]);
    if(isNaN(inches)) { inches = 0 }
    if(feet) {
      return Math.round(feet * 30.48 + inches * 2.54)
    }else {
      return ""
    }
  }

  toLbs(n){
    return Math.round(n * 2.20462)
  }
  
  toKg(n){
    return Math.round(n * 0.453592)
  }
}