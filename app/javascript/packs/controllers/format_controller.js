import { Controller } from "stimulus"
import Cleave from "cleave.js"

export default class extends Controller {
  connect() {
    new Cleave('.is-format-birthdate', {
      date: true,
      delimiter: '-',
      datePattern: ['d', 'm', 'Y']
    });

    new Cleave('.is-format-height-us', {
      numericOnly: true,
      delimiters: ['\'', '\"'],
      blocks: [1, 2],
    });

    new Cleave('.is-format-salary', {
      numericOnly: true,
      blocks: [3]
    });

    new Cleave('.is-format-weight', {
      numericOnly: true,
      blocks: [3]
    });

    new Cleave('.is-format-height', {
      numericOnly: true,
      blocks: [3]
    });
  }
}