import { Controller } from "stimulus"
import $ from 'jquery';  
window.jQuery = $; window.$ = $;

export default class extends Controller {

  connect(){
    $('#table_id').DataTable();
  }
}