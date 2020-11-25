import { Controller } from "stimulus"
import Cleave from "cleave.js"

export default class extends Controller {
  connect() {    
    if ($('.is-format-birthdate').length > 0) {
      new Cleave('.is-format-birthdate', {
        date: true,
        delimiter: '-',
        datePattern: ['d', 'm', 'Y']
      });
    }

    if ($('.is-format-height-us').length > 0) {
      new Cleave('.is-format-height-us', {
        numericOnly: true,
        delimiters: ['\'', '\"'],
        blocks: [1, 2],
      });
    }

    if ($('.is-format-salary').length > 0) {
      new Cleave('.is-format-salary', {
        numericOnly: true,
        blocks: [3]
      });
    }

    if ($('.is-format-salary-roster').length > 0) {
      $('.is-format-salary-roster').toArray().forEach(function(field){
        new Cleave(field, {
          numeral: true,
          numeralDecimalMark: ',',
          delimiter: ' '
        });
      })
    }
    
    if ($('.is-format-weight').length > 0) {
      new Cleave('.is-format-weight', {
        numericOnly: true,
        blocks: [3]
      });
    }

    if ($('.is-format-height').length > 0) {
      new Cleave('.is-format-height', {
        numericOnly: true,
        blocks: [3]
      });
    }
  }
}